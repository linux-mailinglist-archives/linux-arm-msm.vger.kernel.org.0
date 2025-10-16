Return-Path: <linux-arm-msm+bounces-77643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C209BE55D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D245E3DDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E342DC76C;
	Thu, 16 Oct 2025 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQ1Ca7B5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219521CEAD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646139; cv=none; b=qvN5LuzcsPC7bSfxEoybxmjFWzX1QlCmJ47b39IjfNY2YXwYY39NxnJIcmdXqrgqk5Gcup/uPKlxOgLMJPpfn1Ynu14Ug+OSgCD0c/kWWnH6IL/ey23WyGHWkAFAmPJI1MH09sfBSfo1DnnyQIyS463iRnd0B27z4hkhxrGZq0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646139; c=relaxed/simple;
	bh=/BnkzLG7iF5vjjsEuhMhpnk3gLf1GEWGWf5wGNVMGhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2o81rGJEMtEktVn4ODhqEHmO0/dh1XxZxCn8uE71LAgQ93j7xo/t6SC2WkhSp0X7mA03GAXC2vSVLeTztjvmIdc8frIQm/3Hjt78551Hqltiy/JCMPvjKdcOF143As94rpBWdqtSnQpyJEsRi06lywKHeu8nLPHp3FFxoVIxZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQ1Ca7B5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLZtn009599
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t4XeRTtk1HhmwuJqivoNSUwm
	vc5y3nht6ULpzG7FoOU=; b=EQ1Ca7B5u3ErYhxM5XM/jZbhsVuk/QMCZSm4CVyc
	xvzCG8WsO7+QXMbVhlvWscHFpQepb6mr97s+9iKjaEEr+/0t/HXRNd9xEXXftf22
	tD71PbW0BQKQSzSycxYvagZ6q4t+B037vCE+8K8NL4YqIyQH3CIoPDWgd67c/ZRZ
	IGt754YNOSQsPQCLqSa/pw23WZcU0QrosaE/67i1AuFLUUz44/Jw0e50DW5TQ8eu
	v0nZJShbWqeG3lgcvLkPEXQxenDkMw90Vhe8fgx3hCKfcM8rYFLFp9YWGPSf9nxH
	iuOFoYwooRrICLVHlfLzpQ6axkIXcIyRUPvj0vSfZEDRIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c9jka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:22:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88ef355f7a3so434203585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646136; x=1761250936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4XeRTtk1HhmwuJqivoNSUwmvc5y3nht6ULpzG7FoOU=;
        b=HrZYn4t9O/tpMpXcTnmLmfh4pTY3ko+fieHuZ+9+k4Bg+DRiiQIaTopZi2ovdtqw0n
         EKC8nbQBRaM+/zLUcnQTatqyfI3d0tila1iw1rXyjMDr7LO4aStpq/aYIMQbT9LmPYKt
         dUra+6MdaJO/rhZW8741hJn+BqDqv+qcJXClpH9PWGggrQXD5GUdI9pTEerfBwgcbKlY
         ms6CXlA98knpXhk7iC/55d8NFljsAAlia+ub08DMTl32rEhEPrM7PNmh94F1dNodcxc7
         Cxx3BFNglZlIlQ6FVhvjv0FVHrZvE/+ZjDYhH4KNtsxne1SQ9IHNHEu9tsInsqQS1f43
         kE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWX9c++qh76DyqVAI48h4MPThE/26St6XZHEo4SlQgGqAKq9/4PT5aNf/g9JFXGslct9p+tM+Sj6RqRC0v@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOrT1OhkAlKNYUjyxwf3vDCtulesvukoObYHjEZRvkKdNAPlB
	c6VlLpSFrRQuXom37gNUvLMHpXLEdHYGvorJ5FRdjvz6iJmTbgtGiw3+WrJPoKdHhA+QV4ScZCg
	lrFJ2Qx4YB4qxmon7W4ci0cYqx2HdBfTIvbVOEs6TZssqkqietYm/p7hTmXFCSk86+Wn7
X-Gm-Gg: ASbGnctImvgGm7O2DEi2fs385yy9DliVKD50NTDeNOqikt/Yqwo17Vj815EG6dH9QIO
	Shi2Zm5ESMhEZOu5a4wtsh5JzfSSvqfpGhVnzVyM4LdQHSsSwCUNtflo2Gv4bm0/LZWMZZ7fbfV
	9de2zqodR2lk2ILMAMQJpf5abXWjnfv9O0G3AuFi0T0Mpi3zaFILtZt9FVBeJpKFMcuItjqAxod
	ZcY267E7i+eIA+QIpAuc1ZQALyMaq5EIgiaQTbD3TqzExLXXIo1jMS74ZD3EeQkijb76WGR/Qj2
	OQWgqexOz77gbPdwm5Y1L+vlyiw084ba16GoT+6SG+5QpR6xKjaiwbg4kFmHvmegbZPSC79Hidk
	nEfvd6xnmtxuL32mjKUaIcR2AKCHUIN6Oj+eCT4NDlTHfDrpA6DYnGeM4vrwSowTfsTkzYFPpW/
	pJWx1b5/moJoM=
X-Received: by 2002:a05:622a:1101:b0:4e8:9601:37f5 with SMTP id d75a77b69052e-4e89d05bcd6mr20995741cf.0.1760646136055;
        Thu, 16 Oct 2025 13:22:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrcAdKJUHa7P+g75kVAeMcu1GBVw0vLJXNi7Bmcd+TwVbNriITJu0bKiz1xjIXDkX2pPHaqg==
X-Received: by 2002:a05:622a:1101:b0:4e8:9601:37f5 with SMTP id d75a77b69052e-4e89d05bcd6mr20995271cf.0.1760646135519;
        Thu, 16 Oct 2025 13:22:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f9148sm7376487e87.44.2025.10.16.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:22:13 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:22:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/10] clk: qcom: gcc-ipq5424: Enable NSS NoC clocks
 to use icc-clk
Message-ID: <yegaz22k6jpn657tyuiavbchgc2unaoqgvsjn54dzdhnb6rr4s@twg5yrmxx7ot>
References: <20251014-qcom_ipq5424_nsscc-v7-0-081f4956be02@quicinc.com>
 <20251014-qcom_ipq5424_nsscc-v7-4-081f4956be02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-qcom_ipq5424_nsscc-v7-4-081f4956be02@quicinc.com>
X-Proofpoint-GUID: rmkfeHwnuEo55_GB2UkE3jMmg2eptGEG
X-Proofpoint-ORIG-GUID: rmkfeHwnuEo55_GB2UkE3jMmg2eptGEG
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f153f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DdE-_dUAR9VioeaCo_UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX57fYyzXiQ5W9
 IWX8e3rgHMBI1jHWb/9//dJAxSzOGfp6oySsIhyk3b7ReUeFbBgf+h20LHc5EgMizEdhvQ5wF6t
 +/yDC6kA3KRdvCHYF/ChYBneLqAsT2LaXuKUhhHYr7ap8kkAmbBNEpN40raNB8EwVpInXK1MlNP
 rw1rZyxulv2AOmtRb3RrhErQVV9h8Aeo0SQGTpgQEkSSjDiARYl1cTd2shDaFTx4lQC02nS94Ti
 85eELhhgtFOsm1B9fU0yHclszbtaPeKBHmYMr+jxVpJpGUjrT88MDxVqMsR4K/mT9uF7elc6zqY
 +3VE43UqMZFfzSx4NNMt5oVPy/hR6vtEeEM3qDEvS9fWOLfxu1ucqsDSq8fo2Jms/FCJ5mhD3dB
 7DPo8WPb6gfkh7/HOB6xVioPcEyrKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Tue, Oct 14, 2025 at 10:35:29PM +0800, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.
> 
> Additionally, add the LPASS CNOC and SNOC nodes to establish the complete
> interconnect path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

