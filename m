Return-Path: <linux-arm-msm+bounces-84784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE3CB060B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 16:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B50F3006F73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281BC2E0901;
	Tue,  9 Dec 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff3ji8pP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/z/TwMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0961E5B7A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293318; cv=none; b=jV3qzy5SIf+7g1ClMZWzrp83ZEOveMl+airwYbLxFkuvt0RS++RnwqZ7Pi0coEnj8agYojLxHdgHPk6depPGHxoLt7puJyjDX+e6t3SCvF2W06ruTKasu8RWRun3haUE7Mq07pM2DqB1GqWsG4id5GhNEiC5NiA+u1iF5MT8Z1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293318; c=relaxed/simple;
	bh=bfEpgrRI87ilasIdsOHik5nfvcqiS4Pk28FA1VmQzh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8s/f1h6/MB69ZAt5wZFV8fkohnBGNpYzvlO/hnqxf9+hKY0XA68x3dFB9q3nVbcv9U52dT2AUvCybBxyoQF+JQ8ZmzPzHD6IRxdRNFi2tz/WxIlpcbij9g7IXZWgGPnbO3dEZW4MFAGH9Kx2sr6rJhI28B4zO5vl/M6alDknZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ff3ji8pP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/z/TwMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9F1Ea4413125
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bR71Xk5dq0NZn6EHNiA2Q9TN
	z48IxtWfylK+4IF3o3k=; b=Ff3ji8pPZzx5Y3fHMEw7x+osjsRYKNuAL4DXtO+/
	SCbA4/JrEv3HQVTo1CwL0o9/ch09Q8HzfMB8ZsnWH29XSvBodTDNJKI9in8zh8sH
	NaCp55PITi59U/psuZfYkofoGIa2geiAi7xYqepdjRV7npP2+FCTaThisK5dHKQj
	cYOORY+W5XsP7VhFW1Tr24KfHOi//3OSAJjrqxDT4O7jonKHxHkMELN40PqPXkgD
	4URUHRRgULJsyKTxkEoNkUDKhvvYsYAYa/GZuVfKhWwiMJ3zjppmBndEsoCLdqJc
	bFYmN30RTPXLtyekdFW5WurejONG6/UYztsM51Xx7MBaNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axmg60c8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:15:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee2fd41c2aso83624791cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765293314; x=1765898114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bR71Xk5dq0NZn6EHNiA2Q9TNz48IxtWfylK+4IF3o3k=;
        b=j/z/TwMdZcG0LXTuNRq9UGn2D6BCDtz36dCUuW9BfuXm013fF5/DeY/1yXAxFpvkun
         hwoy1F1gtp9czIjs9vjJyLZT9FmFN4Pn0U+4rHFebrBtv3DF3mB3DiXrCStwmn/K37xG
         epXw4skZFckW914daQ9GqiQFBHj6oQrTVTIb0/nt/11SpoF5Gcr4VpJQqKrZcHxSsgYC
         1KLDy5WM3Ib4hcut3RI8ecwN/rTqx//IVW4q2tWT3MlmItmmgRrdnMnXl7hTUJb8mRaL
         nGcrmOZKgfYB8IdT0WrNUR5JMNlKZpT6FYpwnTHMO6EdGTWMSwckNAK/lsObHJ/TjL0X
         ErvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293314; x=1765898114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR71Xk5dq0NZn6EHNiA2Q9TNz48IxtWfylK+4IF3o3k=;
        b=jS97ujcQlxvecb97KgPevae8j3IfmkNQptHRt6KNWhtR3tJePJRUZzOojGuFgeRlRK
         MTLCWr9tiAu1dolHrGWDeOfaoywD759I99ofJfx5oilSHp7E2ihEJ8cnm96KGFkDPCbU
         rZodDrE+b/3QwLSbClojdzapUwTwAihBp8OnjW5zuwgPiQytW1OK++3W8oUeJIMxVKlw
         we/JcqN2r6Iyb+5rWlBaifFP8T+p8E1bExyRXkFWVGwDgNkpVK4/FmPwPcl30m8TEyfv
         QzxavN5JxrDpweJFMLgCejt9qehRHktXRurwwUYcvgKGyM2plCteB3o/iKrGyEE39JEL
         TnTg==
X-Forwarded-Encrypted: i=1; AJvYcCUU1LIsqobKfQRabdbbeL21PMRfSkW6JYgSv0/rfLIh4+LQiCLj03j4w0ypNkq+wPlIpOTz+cViaFgd/dZM@vger.kernel.org
X-Gm-Message-State: AOJu0YyQjMGAODr8YHnndPG4TN1L/FPWkWEkSnAsEs01Ccf4cZSoa2cR
	uaMYfWQCLSsTEMDQXDfyiGSFtAX8lTjCdpsN5OK79rIRdiyKT3MdoxZb105QIT/nUefRSSc0JkM
	pMWrGmxnY2SCunKjqnAgzcf2lxNQsEnfSEuOu34t/TPAvf9J4ylvSMoXPd1V1h+2k7qCL
X-Gm-Gg: ASbGncuhfdVabgmKjCX7sy9wbxORx3YBSyrzlZgghTDb/M2XhXQPokB0jf0SOfLUaC0
	0jrtuQRfp2rblO9eHe2IbEgJcapx+h4Lfp2uNqht0cFGt2bbSpAjE5+Qi417q/UuLk6mGetq+9N
	1/KPt0EiOW0sQU/otVcRP+iIOaKxD/xsepswZoiAxsuf5Xn1jVv6TME+aCWJ5qLaJJeFYpqjYli
	1JgzvkTKCQD50ewMoKzrIGHuL72xXFNOj3t3HGDBPk9G8UCeiQMogmcFk2FXzghkeexMBkNwnH1
	KTrQ+Ym6NSgp73scr0NazVq/YQeL/1yQBJ2MqeXbE33jBQK70TwoqErQnBrhFYSg89DVt+AOvoK
	AxDuDg3UkF7AhDEI6Ny9K/mJZ6fVO4wcSUIzUoEu3ODtF/2/jmQ5yP28VGAbbotJl/ql8ie6gJg
	SpGrQWxKZs2r8PoWLI0ALczPc=
X-Received: by 2002:ac8:58c8:0:b0:4ee:4a3a:bd05 with SMTP id d75a77b69052e-4f03ff4ea88mr178501901cf.74.1765293313842;
        Tue, 09 Dec 2025 07:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXVh7Q/FO5up5b/G++0eFmJ9WKGEH2Sj4mAijYLfqoYPevma7RcpOSFo8BAf+CROwtlAz3+A==
X-Received: by 2002:ac8:58c8:0:b0:4ee:4a3a:bd05 with SMTP id d75a77b69052e-4f03ff4ea88mr178498181cf.74.1765293311235;
        Tue, 09 Dec 2025 07:15:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2465bsm5135862e87.25.2025.12.09.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:15:10 -0800 (PST)
Date: Tue, 9 Dec 2025 17:15:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <67gkj62fytmyle3ju2pipm6fymbv4aqwjhprjh5f6efcdulcfs@tnbvsfrwkhcw>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
 <20251209-gcc_kaanapali-v3-v5-2-3af118262289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-2-3af118262289@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExMiBTYWx0ZWRfX/0KG0+w52dgy
 S7wDKR+6dDfE+bv8w+166fcyLHYJs7Ap/JegaCjaUZzaBlzXrMPJR7JGvfQtOB+nxuQGAyWAlg1
 u+HLcB4xDGf531NvmnFMdXE8V6hr1lt076WabNF16eF5ivry2FvCuflZ8I6/zfhJSc/15FkHko+
 L74FZixCtovo2bhfO/pgfsJm6Rctm7xbXHh6K9swXzgkuZZcoLWYtRl8hXCCLAuPERDMD852Hc8
 hiEjqDzx45sv5CnNyZ61baY2REW5RWrS9ZNPdIktO3iWmPrPlqhsAu1S9y6DR1egyofWFuPj8S7
 GQdMQmuJDw/jCgoCJQ/XvrQyqPf6ySbzDs845Tv19zjSuWyunJ834lFt9oGPm8BTt6so9EaH6W5
 oll6/qRsVBIYtDwX/Y8VQairkySIJQ==
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69383d03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=x2DRelJqk6z56t6zBn4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: EcxhFaKjgj14iyKIsBDSeZtO8waS0mX0
X-Proofpoint-GUID: EcxhFaKjgj14iyKIsBDSeZtO8waS0mX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090112

On Tue, Dec 09, 2025 at 02:19:25PM +0530, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

