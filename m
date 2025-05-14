Return-Path: <linux-arm-msm+bounces-58001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE6BAB77B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 977F83B5EAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7449C25C706;
	Wed, 14 May 2025 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9fObCbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C81FC0FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257339; cv=none; b=iT7mvYteQPp9VbmE2QkWR7Wt4BCJ7OnnOwK8Rr38/5i3k+xTQ0Y3DEEwl1vRHbwTvKr+O8hpaakr636kRo8YLPeWMKeH6kGnmet490LO93Y7TorgQb2aX12ngIrYfjFWHyWLLk264MKkYRvbgP/maY47ncXy3sTFnOYUv+2MWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257339; c=relaxed/simple;
	bh=qvjR2XXCGE2xNkWvFLZrOlDwVcZxNCldkgRm3IdHpgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEq2uLdcJ+dWR07/8ygFB5QjxnM+OiRpqWr78nLAeFq55EzmmCQoYCi9TUKzCvYA9AmaUFfcMn1Yn6ucVACgNFh77FK29oYx5wLteMquNirta/vOM3TuYoQzDel4MkZ8iF95h7EwDrXWxnwkhBwNoYRPLGsTYcBj1XTS+wO2PXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9fObCbc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ9oqk013657
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CSgSL5tsy6KVjdqsenP3jEhW
	60sG6ohO+Dj54gdxcXA=; b=K9fObCbc9SloZ7AxXu1IgLDoCgJ2LSlgmEZ4PNhK
	+16XHDBk3w/Q8RZu9PCyDfqnYfR2enNvfsmLZzjhzW/W6f7HhMlJvz174jxDpB/f
	pWlFI5HeAwXQrRLjg7mDTn6OPbaMHQXad4agK1kAYAZTmYhGobiYSBEKXlqLH4On
	ANRQAHux1yfL5fL0VsMr1CUVc1Y05gtyITlefh9ITwFput7Grj5F/Xy6IG/8k3zv
	3QzfUGDOr8NE9zdmJY56cgpbYq9/nrRqPWHlY0ygEvOl9XUPQqWRP+NUu+uJNlSm
	iENpWPD4cXg9wZnuIASVIQyXju0TuU9Pb8o/DhrBAfX+yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcym5my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:15:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so61008085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257335; x=1747862135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSgSL5tsy6KVjdqsenP3jEhW60sG6ohO+Dj54gdxcXA=;
        b=hiYMRVe/hVSFlp0P3+XG//YqIh98r4gIRW0hW6Thud8E1sQN2LFf6oEqxfADNgtgfe
         FudrwSPppSQX2lvhc1VGIfm3Zp1dj8wJiGGrAfbyX7g82FLdI9c4/8uDLNvjc7tC+oeZ
         Kc9etAGt6md+h5UooW5NMC/MToUqO0XPizxn3Syt8XNSFxs55xSuO5Ja+hTyyKe+KRqk
         E1eSZImAxOs9BVcKjgKa5h6EKL5yifxZobkWYdNFwxIJIN2D2gcNIrbtKc5zYcVGVFdH
         X16zmWo26XIotlwdqfV0T2qq0sBp9Ty7LK+jfgQ6vBWxAqn9kzoSirvwQI/RNMTjoV1Z
         rg+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZDbNv+n4PG9bKY50VTJ82g7O11xiZh122ga9sHD5AzL4E0cv9BEG1WtAEbRJMiccuN/L2MAxywgXgB7Sc@vger.kernel.org
X-Gm-Message-State: AOJu0YypBUH5v1VC7G2nikoymAL7FpxZZzAwRFo5fqpJtIBlPco9BJgL
	ASYybTko3tpxjp23wop8zwBwXNFYRQn73/Nd2J+SgpLjX1Mknaf3rBdoyo7aG013YjnNEUbVUhX
	Uz1sFSAqU4O1AHL6NjA91mrwXxLdGwjCwlUMashVggLHMnSQjV1avngwr6hiSF7yC1mpp
X-Gm-Gg: ASbGncsWs9ndQIKvyFxm4IzAU/oI+Cul7Si43ziti7BZ0d8zhtvpKEMuj49gri0whgy
	7Lp1uZ0CVer5oTHdEwQLVbYAdYNtQ2B9h9xYHmQlYPe/yUpz+LJ3zOf9UurphO7vUQ8eEeylWxx
	9n8SFwKPlGBZS7YBPByn3cDXB4dLLKuKSysefywUyvdBe3bpGHnLT5byRmmPCmKUm2tYRqS5ldH
	5SXJb3PMvKBHMQG1QUmcKv9/uKIF05YgNayJiKG9eL55X6wcnZaFWLoXhpc8cCXQAXTh3T2AvyZ
	iXP68q2bEreALt9szqN4od7y9vOu1Sez93+av29tL9DqkXKbiozplfjXgwmQUAsD2qm2uC21QDU
	=
X-Received: by 2002:a05:620a:1d0d:b0:7c9:230f:904a with SMTP id af79cd13be357-7cd39de2503mr208510185a.14.1747257335564;
        Wed, 14 May 2025 14:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF3yZJxhZiWN3ImsNfTVfdXkr/LJlPTcnXcAxIaHup0XQAdoj0fTfNGu52Ukiv4fTDl8MQUg==
X-Received: by 2002:a05:620a:1d0d:b0:7c9:230f:904a with SMTP id af79cd13be357-7cd39de2503mr208505085a.14.1747257335213;
        Wed, 14 May 2025 14:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd303sm2398927e87.245.2025.05.14.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:15:32 -0700 (PDT)
Date: Thu, 15 May 2025 00:15:30 +0300
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
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <oogbxu2uphyhknr4fjbc4ato6q7r2iermvxbqezyqd2xwamqtr@cddhw4kh6zzx>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
X-Proofpoint-GUID: YdC94Ce8VNb8XfQhgVitGiHWX68G2czX
X-Proofpoint-ORIG-GUID: YdC94Ce8VNb8XfQhgVitGiHWX68G2czX
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682507f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=SIHCAja6ksQgKCh-pUUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NiBTYWx0ZWRfX05glYqkjCXSx
 xhrEWgDE9LJggiB72mZ8+dRvv+gmCGMSH1w+YaKqjZ4T1vjk88Tf22XKabITUJfLSukKOjR69HH
 dr5+hLzEK5NVtGxDcjJGWp+o59wBDLVJrav4dyW/jVjSaoBtMbzJ/y+RN4nG5Q436DYQz22iV7j
 4mUy0L2jJ2lwDeV6IjFpSu2Mag0P6T0RPwafkDuWEeD25TvMkinWr1yT2RWBX7ARZNQjZgBDXW4
 7zEn8xLhO1j89y0H0uFIV8jcHA7EreYCspPnbs2cNN5Ypgq+GqnKW9uPuPhU5PazUKyVDfhMDSc
 8mMUhQnllvmxqOHJM/+6FTm7aZA1QlBAseGBNmzzIulh7jQ56ruVw9tKO8nb3lgYTaXbTTPHZw6
 FtS7aUn3QAfZx+9d1aEvnMLck6HmnuLqwI9Vw8GDrfpjrwp+UWnq0UMyzFp/qJniuin97Drj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140196

On Thu, May 15, 2025 at 12:38:47AM +0530, Jagadeesh Kona wrote:
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains. Hence move SC8280XP camcc bindings from SM8450 to
> SA8775P camcc.

It requires MX for PLLs. I know that we were not modelling that
relationship beforehand, but maybe we should start doing that?

> SA8775P camcc doesn't support required-opps property currently
> but SC8280XP camcc need that property,  so add required-opps
> based on SC8280XP camcc conditional check in SA8775P camcc
> bindings.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml     | 15 +++++++++++++++
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      |  2 --
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

