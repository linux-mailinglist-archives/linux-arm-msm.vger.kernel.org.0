Return-Path: <linux-arm-msm+bounces-58353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F386ABB249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 00:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB911891300
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 22:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8497F20B1F5;
	Sun, 18 May 2025 22:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ykbak0r1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA71EE021
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608481; cv=none; b=FSJqreJH5j606trYFX+xTSBBOzTeE4QYDTpyBOTPxqzK/ZuPR5zkUvYf0dvWcF+bxhiikX9xRLc2G1YjT8ZcWYrfRC39Um2/tB8wposXQw8D9O3QQloO2LQFEsTeSMMBItbm5p1jP1Li9nG5Jo0eKwFUPZQpplQxVyVOQBrzKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608481; c=relaxed/simple;
	bh=EQZRvDoYbyCh8DGSYdm5CNwcqtzg8Cq6+npMxPhenyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/m1nw4eRO7SuQ5c19y8F7xWU+ChyvA3yDGPV6IAhyZ9mmtN8gkn4xfyJU/enSBm2JS2pOgPAjjR/k0T05GAGv3mMYEu6LVRVtb0t4HoycdPLmNIFcAdhvmT6KMZd4qz3QHtA/BW+8GMA9HeeXBGQJlKK7s5QG88/1Xve3yclaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ykbak0r1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILZ2G0015756
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vc3WSizhU9aSF7EbNasyVlOQ
	hot/U+WGrlUH3vMwD9s=; b=Ykbak0r1yjLI/irIIR2MXUgQ7UAgqZAIlyjljHMv
	DTJwaJYjWkYdB7Y0Ptpd4FG9fEtoG4qIHJLeY4ocNKLIhUlp+WJn/uoQ/nR0oVyv
	eUUmzod8lsQJtCmFii8kuBELuLbXGkml2qFI2tZMD7ki+9COdu/OxJWYxUtGE6LM
	YtdanqKqidGaE/sgLYNMHzCxdpSpFS0rqXGgyqyaO6h0RIyfu9RfWZrVkVt1Kw76
	ElqDII9P/ASiQa+J0pEaZW6Rr5egWUeq4d/q2LpBD+/nzB47UqkKV1OiD0eKMtcw
	UQmQGH7txNO+57mLJhM2zHIh8/DT/LzHSRvAYulx05IBVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjstgqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:47:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so31546496d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 15:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608478; x=1748213278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc3WSizhU9aSF7EbNasyVlOQhot/U+WGrlUH3vMwD9s=;
        b=Uf3hSI66TmGe0SaGdvselUfymGrsrLa0G6tObLTPVorGRQfAZhich4WaDsA6w7IJyw
         WH5i2+Z/Y5Vb4CKwTnQUkF3riJsmRLJoIPNSAQ5/AfboiNvASUL0/oE/jfl2/nS9p5xl
         00bXxWf726Nm1ZorC+fCiEno+ymHHD/HondXUAJ4Y20Dn1H+SS6vRKjss9TgZKosQYZb
         UwTC7f2GP68tLzsd8fqS57W41gi5onroXAivPHEJeEFCOZDhsVTAWCmkZym9PdM+WPZV
         gqAokUwllE95mJSWl4aZkqDy9qGb0D1ykOXPCa4U2XJsu60ei+5BFlaoY9xylVw/i90G
         t7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHRyCfSy73xK26HwDqZpHccZXUmH4YoV100yF3ri8usv4pFXbCn91YqkHn9bJJk3IXbFIeXfDPE8PPF2Qt@vger.kernel.org
X-Gm-Message-State: AOJu0YyauUuwY9S5WDgx7k2RfIl+ROTQxLaOMx4/2x7dduxjvqOR+BgD
	yT4WR4bPjBiZ2cz0EskHfjxvVjkNVRWHAZIVEiY3GyW6XFCC0LNV7oJrqULaktpiabqzFfIiej8
	e15r9hgAZ3DBUX0i65kJnb0jxRYqe7YEci26Bpm9ywfTmUfkF1qmprhFTuxPhLXjYt8Cg
X-Gm-Gg: ASbGnctjO9XhrwSZU+u6lCmBThGMWhFxicumSDdpQIYkr+WWjhOezkVl8NBZ1Wp+D/A
	fg1x5hsujFDrthD4IYr4sxl4/k6WqZGpcR5xtfGmNwCwEbniNuEXDSucAS2BV5TUjOzBTHJ+yGG
	HK1hUvgiT+W3hhML2VloiQmvW7iq5/vm3fiPfotky5KwN0U5kEMfagmQQ7bfQvUQkzP0igwqQrM
	Fdul38Pr8/YT83fxF0G0orNjsJqa+Xt0HNskF4YBZczae4Qm9p9HuPXbCmV9dOK5p6J3rvB1usH
	Xe7HLI9DcE6Z13fj92NbL+HOk/WQN0t7L4T9Opj+8oWSABRt/xcZtL/T6DArieGdWQ1AMpahxIY
	=
X-Received: by 2002:a05:6214:2a83:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f8b0849362mr157924636d6.4.1747608477708;
        Sun, 18 May 2025 15:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7tAYjxfd4r1T1qjru51NTM2HHKxx0e0C/hKdPW1JjgLuLcFbRWRts+BYv+uzd5ciQqDnOkg==
X-Received: by 2002:a05:6214:2a83:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f8b0849362mr157924366d6.4.1747608477350;
        Sun, 18 May 2025 15:47:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328086220e4sm16437111fa.111.2025.05.18.15.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:47:56 -0700 (PDT)
Date: Mon, 19 May 2025 01:47:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Message-ID: <hur4ttih7f44obug6e6p7x255yt2wrif6x6maikc3w7llm3ije@tzc3rqswzyrq>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-7-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515162722.6933-7-quic_nitirawa@quicinc.com>
X-Proofpoint-ORIG-GUID: 2Mx00vaBQMKFPhonDYdsO_yEVGZM6fnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIyNiBTYWx0ZWRfX/gt2onXqrN9I
 f2Goq+Kmi9a9Tq/Ihyxi/DdxKkNv9wOTtqWcPqebj9JdVUgg5MLSRHPN+jGvLhVpwlbE0sp5MCW
 qjDr/gU7kuB+AvHU+B+hnFv6k4YONH7eS25ztN4B2ZEKnMgSgM/Tbp2OObPBMLvh3ChmAYvsmEA
 1d78EpnqippsJJCuGHAxNJfdcXktaSGogcNxdamo3VCagP0bm8Nchv0bS1xcL9rfHBA7Q1O9ztM
 kjL1jcC27tJpV73mI/I5HwcKAe86Zz52d+tet43HazRBZ+QPDRKz9wdryUGWl/K6Nv+dY5T2oWm
 v2ZvT31rinjGGjuQ3s4DnRPtGKXq2wNbLYu4qPRc002+tcWa1Kb2aLBtlEBoexuI1ovQX47FJAT
 RCYgGD2/gf14P6Vj3IJqFeFAd01LmzbgzVQkbLvLzFP6TRRoPfVyBDJOXn+TLezwef0dBs3u
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682a639e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=R_7yDYiI5xYpdCZW9wQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2Mx00vaBQMKFPhonDYdsO_yEVGZM6fnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=804 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180226

On Thu, May 15, 2025 at 09:57:17PM +0530, Nitin Rawat wrote:
> Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
> functionality. Additionally, inline qmp_ufs_exit into qmp_ufs_power_off
> function to preserve the functionality of .power_off.
> 
> There is no functional change.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

