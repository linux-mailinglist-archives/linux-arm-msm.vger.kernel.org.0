Return-Path: <linux-arm-msm+bounces-58004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F6AB77D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B99B9E4ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC826296704;
	Wed, 14 May 2025 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J68amNSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55A221F0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257779; cv=none; b=BA1y4sCtZlxUDvvIB1vgbhS+07ekXbZMt/kooqRHFVWXjdsTy7KSQ0kb2nEFUxcjoclWpnx86l4lua7MbZNwwKUfWJG33KndP9pwKJy81bUoawv/+bd33FIpSITSwRfJm6bLbWX3fPymj5UOmwT97CYFHVkK8/5ctWm2tDHlFnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257779; c=relaxed/simple;
	bh=c5fFV9H+BSKBtutgT1QIm/vnu9c6kXchdedMNOkK3yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAm9U3JUJRDSQ5WLPJzs4PjTB6ZxXcwyEGyCKe0yLXxsXk3YNxpKDS9H/xd/El+kC7HjTAIuVGMzdJI/tQZkzxo2Olry0e2c3TNJnQC89yjl5lzdmLd3z0Lg6Yayr/+r7KHlv9Ivor4785H0IgMxpEiyvfZTj0Wi7b3IrkrJV2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J68amNSx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKqpnL025440
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=064MyDQuYylLeG1j0XexCtNC
	r+NDg/CL9KLNtbflBNY=; b=J68amNSxaYN+rmoWT0YtdKQgLO6b24PclCq2ELTV
	+UsMezllQ2hDMmo0TGE6MytBx210XubPiL/xY8e1/U/s2uo8Tsmjp2zIivLZls3z
	3111idzbGmKOjBZ6gYEZTc1ttjV3j1FjJ714qNtO+qN+4HxVuuoKFiK9UEbDSQmG
	CFCTFulhqaW4T6ymqihULcS+uwuCoPuBX80/+ob6cHT8xpTjTIB1Xn3MIwjqI9Kb
	EmoZKLNuORBySCUjI1ZO+AdfP1oyW1hftcg1ItZRY35rwW6/TSoSSqS3zAYfCdJF
	dH+AkD4cMsw5aZpM5zFh1fIDxZMtYkL4hny8biwifVUKag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew429d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:22:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990715so65255285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257776; x=1747862576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=064MyDQuYylLeG1j0XexCtNCr+NDg/CL9KLNtbflBNY=;
        b=CfyYPVT8pFwlzhVzF6ApHpsQ4ihRj5E2DzZe+x4B7ysy0wnXKxojjQxG+lG87C7c0u
         bSOU9LhPlY/bi0KFEm9AxjjyrhFc+vmhfLkdCRkHeiq28bsKm2wSkx/3XRugdinaDUXr
         FNZqRitpqTod/J9SREsErBQTNLBfK7r19vLXxEbJYuOe/+7aDkj71hXTx7an6atm5vLp
         ZpDW0P9dZBSB53AsHZ0P2+eHYSDTPRtmaxWxMFhF1pz3337BuGqaFU7/FzOj774wTY0e
         rTd5q5x1HsS7fb5e6DmT6dd4FFuH/s7tw5ujl5ktaquBuibFZy7NsOKLcaj3sbgImqNb
         ZwwA==
X-Forwarded-Encrypted: i=1; AJvYcCUQDD4upfMNuTYuFj+rdU+eIQcK0Purryy0175nfaK1kWRp/2fUWenjg2C4E/X7uglO0Ix58RNAMVQSmuXR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfk9Ap1OH7hmvG/TEhKhoPtPdblr86tIgOsoXQPiTeu/i7I254
	neXm8gOyEHbFwgdUb+biLg8QYhluqMrhGQUJjwAcc6qCsX01mRZZZEfgdq2/tWC/BJQKTyndB0C
	N+bcXBaz7nCOcVkzbuGBfgAmUHA4nOHtLqtK6mHq5lAta63Ju4bcPq98Bs/nBebH1
X-Gm-Gg: ASbGncv81HHbdbc0UJir5Knh5YkAk/BSDaXWaglvKvZm3uiT2dRJ/FLyo0TX4qSJ9o3
	VYoPxKBfXkqk4RvzJxUU7K2MIxDsLzmXHWQNZrOmR5ykwuFKrDUdTwDlzb5kqoFnBcK1SqjAuWs
	ogEtqyfAghm7bmYm3SaeEphBxpiVuON4iKjGvTNTmQYW0h3pgTHSP2oPms4wFmzzrM063zz+55s
	h4/rZkrVbtovXI7rkdIdm999ZEC+Ix/Cyemq4srlhdD+1iiSqsFzHb8Is7PONLtS9OXwwqEvJOi
	ZOP/hHigHM9Bb/XPPJkOLVtl5Nm1YZ4RXNeK5uNXSlYyDNb+sD6AAz85LNJJhoLYSnwR+0+3g34
	=
X-Received: by 2002:a05:620a:2989:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7cd287e1660mr752080185a.14.1747257776271;
        Wed, 14 May 2025 14:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLV1/2fnJECiXioDxTilYEV8/FDq4Qt+gFh1FFYDFUWJbfrTbaGUfU+3rDWQ45mW4pYh9XXA==
X-Received: by 2002:a05:620a:2989:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7cd287e1660mr752076285a.14.1747257775907;
        Wed, 14 May 2025 14:22:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6f7fsm2368791e87.134.2025.05.14.14.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:22:55 -0700 (PDT)
Date: Thu, 15 May 2025 00:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
 configuration to really probe
Message-ID: <hymvgbzqup7d7o6kexvigwgdc3r3vlbjfvcb4x2czjuygqbmw7@ufxwky3r7ab6>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
X-Proofpoint-GUID: Oq7ICpTwQOy1NCX_6hPVddrPR1YJ1Yio
X-Proofpoint-ORIG-GUID: Oq7ICpTwQOy1NCX_6hPVddrPR1YJ1Yio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX4BaoX/mbY2YW
 tgzXi0n1rkqa0UWXOngnxKwIeqmR6+eIHIoxjXm4MfE7y56ZepQXkDbEPDLizbFR0OuRdMlsSDp
 bKxeyF2+6JUbmzhWMpepNcrfM3LtdOZOYwj8nH1WorNPSbkQ6fKdZITG3BK92LOXKl5lZ9mDvtq
 9Twz8zA4McO9NQbD2/xcgHubD83K5Bdd25EG2eAcmZwgiGm7n4cKYf8V2gO2+ZOO03qhda2vb+e
 ES1Eh3qpdZhCq2sXmxfqJLDDuXHt7ExxvXt+b0u5Y0LHEmILBcbnufWZOElHnP2hA8jAJVKq/OP
 xOKHDHLXdZLhs7ajOzUNKZFEt41J++d3Au58UAY0Om9H89qcxUC2uy9yTYkHo+IEbIh2Ww7PSYi
 0u5M+YyO9Ut4V7czPoUUiNkQK6shsSglYogwRUb9aJ0q14m2TB/MFXwZfpif1MbUOkzqVVMJ
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682509b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R-MJ-YjwOO2PQHfhffwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:38:57AM +0530, Jagadeesh Kona wrote:
> Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-x1e80100.c | 67 +++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

