Return-Path: <linux-arm-msm+bounces-85842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D77CCF898
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 716463014DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820A0306B08;
	Fri, 19 Dec 2025 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUIjvHtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YW+UaP4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDB307481
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142638; cv=none; b=gAgTfK+cXagO9dyaIHJ8N3MbRoC35UrfJwkbkgX6sdqJiDrncCpdOLlVZrnmBNmpTy6h2nVWi1hmRtccTUqExQAk4qgY8WdV/9o4i4URri3F1DIRUJh4YU9NmCOFxihAA6MhjcaUOUtZzPlNislSLRKG38xCOvws49Y1snK19Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142638; c=relaxed/simple;
	bh=TnKOGOZfXIWRx+mTUvvfBevE4/2Q/9nz+F4AjvC94JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W22wfHLv+lM4Rl9Up+Yz/mblsUjW9amyYTCzPtdGnM/AHQabp1t3SaUuruhggDsx2E5WKhAh7XNQ/SSfGdJDk03RjzPtBPKh26UGaHkcKfTFzg8AnJCwaWill2sK8BBjC4JOS4XkUlcmOR5FKPDDG6+9y6nmqpSZMK48KE2iWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUIjvHtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YW+UaP4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cMMs3559599
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eI9A3TA+U/EfAjMak9gg0mIh
	WPIak/p0ia7OlFtoThY=; b=FUIjvHtzpnmg0QjQRqO48i9d1UBGcw66nnlAbMCD
	X2iB6zD7NbV+eNRBgbEhCtnyUq8B3Rv4Dh52MUud+v03AH+/dojVRpBt1htFlNzV
	QuGaxJk6a5D47gKpyQfDD2tjWqpHCrjZBdbGoIktiTHJYsknyfqAWed4+mXKV1F4
	94DNxQO2YQeJtYPfKtkal/lSLZ2tr1lGAFy+5tgSjzXKicyOpYCC5wMeiU69U0X3
	yM8S71jhbVQkdP5dxWXAYXHyV7HNvyU8QGBi5UKAR0dq+C6bE6fBJOQ6Sh38kE3R
	vgCNRt3mRb3uSs5OXPWy+HxmYdUQ5Xu60kZ6OcH0j3Kr9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2caeys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:10:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29ebcf93aa7so7131395ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766142635; x=1766747435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eI9A3TA+U/EfAjMak9gg0mIhWPIak/p0ia7OlFtoThY=;
        b=YW+UaP4/z8NCjnjvWlQq3IX++Hn5l2TUQMwhQhaHVF7axskX7NTZRU22BKXFt1+Va6
         3ViqAV4qKP239cKTk6DNlp3QFLsQAhDIY8B1MO5gg8/W4DGENayoYrbF61esDBijatsl
         eXno2BPASMiRZCQlqFI+XC5QqtRIuDxHEcwxaVilTNB6yEkHySHPjQ/vDVZI5cM7VOQ9
         Qv5clYitevk/4qyFG3mwWFfGT3Ctm6BTqAwuxY/PUNAmH9NAnPVv0M7bVBdLp1rpb1jE
         gHwGqyFsrYOpeNO2LCZkFmHxl6/DXkV83vDZhaTVq6xwh7b/ayN/OU4ShNN45lXMaWFW
         CgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766142635; x=1766747435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eI9A3TA+U/EfAjMak9gg0mIhWPIak/p0ia7OlFtoThY=;
        b=AStZMU/uqlkqsNKyYuGLATEGaUD2yh62pFnoQqJZPdZJmVt/39BZTHAXA9qD6b1+Y8
         yfp/vZt10R/DAFJYuuuBwfS76ExKMYZj+7ioeeXInEEZg8xEHOAUchI8USTD2MpR7CFU
         BR8Y8M6ynTlaj39sTfbjYHNygQTQ8PqoQPLtvLEhlUmA0RA5WrsA13GczfHFHU4uNq61
         s+wfOSPiSoD68UDQOfYj/BLay1xN/vNYq9/WNBAnCca4JcGFF6V+J10FI1tfcViVbTLO
         YY9aUURTrDcRxXyPBZQHeeET/pBFPJoN+yDXOMvaWpnyHHqAnNGSkMsZbs4/Wuiiq5BQ
         g5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZr6Agk2wI7ppspqJcsv+1C/PfPlUrU+hVDoIOVQDvx7mt/oYphfmL3t3Z4eh2JO7UWIyHhTJG7tFVrcrt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy85qLidsz6StKQOeIXE9/x1WuJkYQQz/AyJOvdS82vAwiqgW6
	cc73tBSvhJW81EnAzylbL8NBt0cxtKB/Pu2XzdJ5KO8Asj0m477S+ys4nKyQ0FF5euDYms2l0u0
	7GUCccaBZ1EKdhGQ28iZhY4zzsfu1vmNRiduBr+T/yQwoKtrwWRqiMUw1w530pefAfjdw
X-Gm-Gg: AY/fxX7x7RtDayCuUq7SqOAmZoKVCMOCfoS4AoS7kHkAz4KlfTs3PSbicNjOF4qgH96
	5D8Toh0AzcoZIxei93V4LILAsotetHkKkC1qwp5WEmNhSAL3tVH4TqCVTU8/nuTUll0dbz4kq++
	JLSEjd9gCgg3PVqbdoH6IGrXAIaFoTVTnLxpgpZG2xtOW+BKDM4wWhsFvg02ByCfEwMpEfGkhOi
	RfnmD+9oZSsSMeNbQotZ003aHU0wKtSwSxwSQQS750P759ea2fHlY8vyjqu1ISEb9qw5ofMQCVk
	tv3ZTZwef50OHpn5cuEqpbjk16fst0CjdQThyBYCtoGcAcdUm/yGe/wzKzXX+7gJd5zlA97yVVa
	ObqVJmoZFZNxZHeS3hMKH3BW3nB20GgtKeI8LVYGotJGegd0Spys7miZzP5+Wy4s8LEFCFuXWr2
	MeMhwcF30R1naxHX4vxNFCiKLUIuX9JA==
X-Received: by 2002:a05:6a00:2d1d:b0:7ab:9850:25fb with SMTP id d2e1a72fcca58-7ff648e4c38mr1819233b3a.2.1766142635621;
        Fri, 19 Dec 2025 03:10:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF3+wceGI/hOCjSfbm/KufH/fSAQEEUjvFRRq59gSUlub9h9aYLp9EF66blY9sOF+UlrzJyw==
X-Received: by 2002:a05:6a00:2d1d:b0:7ab:9850:25fb with SMTP id d2e1a72fcca58-7ff648e4c38mr1819226b3a.2.1766142635185;
        Fri, 19 Dec 2025 03:10:35 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a844d5asm2128130b3a.3.2025.12.19.03.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:10:34 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:29 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Message-ID: <aUUypVRInkKdItCZ@hu-vishsain-blr.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-2-2246fc5fb490@qti.qualcomm.com>
 <74d931db-8ecf-4b71-b644-d9a82ba54c8a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74d931db-8ecf-4b71-b644-d9a82ba54c8a@kernel.org>
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=694532ac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SEeCSZyuSB0OPg8yeGEA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5MSBTYWx0ZWRfX1ohzRp+NZP82
 U79m4IW9EauBa/DEjtl2Ez0Fx0ZTJy79++SjdZNijxnu04rJEx1EoVgnIATHpCsb/ah9wQi8KuM
 Ty2AVLAmwSRAmvzOBiVucIPxOwHthgMQxk+bqVKAMDeF9e9KdGvP+kR+uVmmXBGOvrzCUO1Jv4q
 rWmdcunjmY0ylauGGmfQEN9EU/iYsZDhAnwnDTRLiHCxjh3nqd/id5Qtfp4b+Ehc+gMcide6o2j
 8tcI+mTtb064lbL5Fe+r/6mcgfMk/5wqOBfKL5Rpy8NxmLJOMus8+HwLI14w4WV3dyRzNbwMCbA
 6r3s0lZlAY88rVr80w3VkceU0M3XHN2Br52G2MrFLfr50xgWYbmUL4tNwU1zzShg6+cu3OpXwnX
 se9Xp+VxjzXwexOtGjwUOG1N7EFTn2eTMkIS/b/LL3NrDnE4sp5Of0H6Dgq6ScsL5qVI46TYT8I
 ylPezk5duzdiRATLZUA==
X-Proofpoint-GUID: -OJB2U_4Fvw569NjyvAQXCPLJKZXjTF_
X-Proofpoint-ORIG-GUID: -OJB2U_4Fvw569NjyvAQXCPLJKZXjTF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190091

On Thu, Nov 20, 2025 at 02:47:45PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2025 11:58, Vishnu Saini wrote:
> > Lontium LT8713sx DP bridge hub can be found in monaco-evk
> 
> Qualcomm Monaco EVK Full Name of board goes here not some keywords.
> 
> You are adding this to common defconfig, that's not your own private one.
> 
> > 
Yes, updated the commit text in V2. 
> 
> Best regards,
> Krzysztof

