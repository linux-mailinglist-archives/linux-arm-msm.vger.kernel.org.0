Return-Path: <linux-arm-msm+bounces-93864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FVnDdATnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:58:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FBA18133B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6389830810AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA92737E0;
	Tue, 24 Feb 2026 02:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dz0xP+7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qb7LbHE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426F64A35
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901880; cv=none; b=jOR4AyrioKGRZBzy1ijI5WYzx5ajDjokB5HjBEGRBhVjzwxW+WkMerGOReA1qlSinhDCVJJRFz0vUEMSFlLe4wBanErXAkKH7MQIQskeJWy47/LJFohEo/wkmuGISzr1IAQy5LeIPPrf0tFAY80nTg0UmIJvki6NriA8vqfRWJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901880; c=relaxed/simple;
	bh=G81DdD4vTlry2GnkMp4ET2OwnQPgCeeTugV7EsoCThY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He42MZLxqnY6ayQOpV3Eq79BK5F/KscOjrirC+xu2RpXNyQ1/DW32QGSOFDso95Ka2HwtxzUqx+r6tRmfFX2dkXZGqgdtQ/5qGc+/YQyAOkzb/L7Ge0ohWj5UCrZRJoNQKHW0XWwOtfFv3oRpaE3HLBwcsiFQNaibV/l4cbn5/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dz0xP+7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qb7LbHE9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2m2Jr1611842
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhNXyfaUg+jrqvg/fHqTzOO6
	8WHG6WArir/jushJII0=; b=dz0xP+7kiywlBNd2L94/ZMBzLtntnLyhVEmWfDY9
	IIG0gyeoKAIuWraaX7ax8pfHYtk84UoSFjkqjdDNIOlwhEbXXkVpuWBlDAvcGzra
	hfr9lzBmy6InPaDsm3uDddnVwJiwVj3Yao3b92PBRV+Xo75j+1G3Rmlc4F57eRPi
	qqMDmdRTl5EctVIXcJjIgBnvQK7bp2cFu+826qMj9gzwsU8hBahq+7hEqAcFz7E1
	6e9mCTsuKPNrt5iEOGWX0O6jCZSwNLishBjLHAO4iAbSkjLF6xPrz+2kz5v3KvvT
	xyfHpcychoyYsT2zFqwFZwgEbMvQrWXxGNhUfan3COOG8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7tamq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:57:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so2554970485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901877; x=1772506677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNXyfaUg+jrqvg/fHqTzOO68WHG6WArir/jushJII0=;
        b=Qb7LbHE9TMLE+Nzyx3/byMym/UKLIwogyLbVBrr6nrOyD/BkH7Y2FuRHoQzpjm/LIH
         xBAWUgBr/moSEi4fxbz3yTeHlXCBDcZCJJrTVArnrnvThm3kFvjBjhZLdbvEsrD8Ze3x
         DED3A7/JjpDTxQqCrGMP90Oz8IOo39UH4cO82kXazNBe3fJR6x7HjVMv8mCq3H0fY4n8
         NRtYLIOcNfoGZ6EElayTcAPWncgVJuzQ6GQxU7FiQcE0iHAoD5NuBiwJ9MemB4i2xdnb
         xjoFGJCAzPf5q7sGz364e0Om+IcCmQQPor5iMUb7ISKhVUerqQjZm5Doe29I8/MDhkge
         /B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901877; x=1772506677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhNXyfaUg+jrqvg/fHqTzOO68WHG6WArir/jushJII0=;
        b=FtWRdsrR6dvCYMl0OmTz8YSPOicwCnC2wJBkbpRh659GigeYkFb4vgdByCnPRCxjBn
         WKB139VaoO+/OWZuP9KG0eof0dDif5XalIDUim3Wux9Xy9UcH7uydEB3FLDhQvh9MUYT
         IF8GpjZ8HY2iENUxAeZGb2J2LKqSjdXNAKtC/iObLfopaVzN0xKk9X58Dfkuz4tozdVj
         VOyoBW5qTDZIEPU4V9X6cc9unxwQyMWu2MYq7fw5zBeUkGBzmteHaojbPwbjvR1gg0Pv
         zoGlaaWxt9eK/VHPL7YzY6OukKofueg0YugDNie+gCQ8HLogVVFvGPnB988TG9omDIF/
         8vzA==
X-Forwarded-Encrypted: i=1; AJvYcCVeALrlRb/DvTSQRtSq574mtd4fggAnzzqPAPjYCzaoHA5RVX+qYYAOzHHxbPU/yjEOnhdl7A9NoU0QYUmO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4w7YhqfQsoP05N6ihfNZZ3T2vDsuYgsqU8QvlHUf4qYsixb+a
	GdS9f/C/seUuQO3az9O+eH9gLgglgNlGC6OH/7B3rW8DZ13kmgdZPntwJOS3e0j1pTk4Emk6ZhJ
	JfzHBYBRl88rrK3/6CZ8t1CqGoEV1X48ifD/SHOcTCdMEvzvCOFLEB0c8/yRWaMavhWS7
X-Gm-Gg: AZuq6aKS4c3Fy2FuGSiAzzqhuDngd2VW7yLdD3q/m3gyiH7/KMOJLFzUaXiLecMvKqU
	akk60yYfebeEUIQULhF4XqrDNvPHWE68ddrcQfARogbBlmtDjB1tmRpu1hMU8ChY+gSF+3Mezvu
	Uv3b1VTEKA2Wx6topMb4MIJXsWoijqPTzo3PrVsXixIzmQU/a7AqD6USsXCwxQCBjSs3gLWWHDU
	HW4nUjxoK4loQ25+HlIr4q6GC9PY2DJKzgTXT3CeiOfEh89oN3zeWS3ADz0cPoaGqgTTcVplh0q
	dUP0r80kg9xts+yX3IGkml1po5b7o2jAstOROMNovGVLuo5eCuFfGZiQEbcDXGZ1ptKHe+yxrby
	dBa6M06xpr6W8PAue41p7QyCpRRrx79t3LmJMdkuJFpXN4ZSpJ9jvgLr0yfcHkKd61y5gcIsSMo
	gbX19/Ygdf4fLC/IkgP20ukCSnbeuuyfAbB1o=
X-Received: by 2002:a05:620a:390a:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cb8c9cf508mr1363355685a.5.1771901877652;
        Mon, 23 Feb 2026 18:57:57 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cb8c9cf508mr1363353185a.5.1771901877251;
        Mon, 23 Feb 2026 18:57:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b8dasm1865622e87.19.2026.02.23.18.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:57:55 -0800 (PST)
Date: Tue, 24 Feb 2026 04:57:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
Subject: Re: [PATCH v2 5/5] arm64: defconfig: Enable configs for audio
 drivers on Arduino UnoQ
Message-ID: <tsy6witnzdkldtkugqrbbv2ewyk4zy4ydvcbxcvmyh7mr7p3ex@k4tg7db3cvn7>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-6-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223133950.221234-6-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699d13b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6UlaXngAVdkYaplpOtQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pmwkdyBJzHvijKfd4o6_bBDpzYRTF5m-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNCBTYWx0ZWRfXyIIEfeKtnHSs
 igThp3hOicuuTa4Ku+VOWA0bOwY7q1BRXmHgltcvWHGvvPLrZPeiQE1CHeDuaoXwXDOCZOcoUeP
 Z68rgwBP6XsHbFdSzz6FEbD3wm6zE27rbthlKPu19gTe4WaINCMGDp5zj65dbxX95HevWoCV9Mx
 Zl+gKsbq4S+BVY1cD/PtDvNa/SUBblfHiLpYY9W+D0ggCFr8nFNeYvkWOoSgyxNaFtYViRJ6slS
 1UyE5WYuipKke9813rkHYvG8BhFdDJAQP04WCxeiaxummze18teFcYJtr11q8g4rMorY1imHlb1
 nBlcpT4PoWJ6vmN5H+bFr2QOo2hwh5tLDVuFsDwxf8xEv/EnlfNTFPA02AVwsFiIf7sB7FoVFKm
 GK0aG0NE9Cob5ThUKJcPzRKJuxMCdqxR+JEtVLQ51gq92yhHppYbd3FTtJNIiCZfwc2PszE+Ry1
 /w7ORnSij0hyd8gJ6Og==
X-Proofpoint-ORIG-GUID: pmwkdyBJzHvijKfd4o6_bBDpzYRTF5m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93864-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6FBA18133B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:39:50PM +0000, Srinivas Kandagatla wrote:
> Enable reset controller and pm4125 audio codec driver that are required
> to enable audio support on Arduino UnoQ board.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

