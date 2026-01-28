Return-Path: <linux-arm-msm+bounces-90976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M0gIbf0eWnT1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:36:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17812A0884
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D1DB3065412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD6F34D912;
	Wed, 28 Jan 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOiVB/47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/ibJ4yQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7E34D4D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599574; cv=none; b=EHeBEmhxTlD9RGjiQuqwneevdUqBBy1R3b8POiTLF+hidBBL8nkPZ2Xa+MbC6aqeZ4s4/SS03UCf3S3+nwhk88D/02Mrv9VEflXFGPj1nOdwlQyBTb4vVtWmqQ+n8oy+71JCANokMKS3D+inOGsJIH8fUTGRuDHJ0InnF119T9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599574; c=relaxed/simple;
	bh=0EmrqGC2R8r+EMt/hGAUyo/s8p0gxfJHDhcCzDl9yjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rq9ccXUbDJelJInCafCeoh6iqjvj7AEmbS6n2t1Cen+AqNEH6oP+Xh+1C/01WVO4IL5pwo4M1j95QgTryhzit+CqUpu5SB9EGo/dnlTNU8qTsq+lymyaIifkDEtldISfjPlTfzAMmagio2rWbc3v5kusFFBDVgxMUfMpjY2dBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOiVB/47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/ibJ4yQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91oQL3879049
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dtH0gsaiv63D6FJ6lGxMPX3Bt/oiCLpxKmOH0S/rHg=; b=JOiVB/47GEY29+7c
	tyZ7zuuAoSwDCKYobegMurNqDL2xMr8q9lgyWl9+MytsvPe0GWqd6//GnStisdr0
	H2gSq0wnNgnXBwG5OhP2Gc373shEN8EI2mD0pcOQ++FxoVOc2In3BCh+cApKiLNA
	F4WZtM2Y+qQVGQJUtqekKWyYftuSEnJWSNQZjOhsKJsSLlYPm2mtULhskK8Ed/Dr
	czouPkt+e18J8jO529G3MwMpW/EHoSrT4L47dzIT9o/EqxBAGku4/rBdOF6R+DA2
	cHtH7azYVabT98BfOUrj7B0maMDdLPOLQZqlEoUUZxjOcDFve17HzEAKyElUOltm
	j1v99Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv17g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:26:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c536c9d2f7so220565585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599570; x=1770204370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dtH0gsaiv63D6FJ6lGxMPX3Bt/oiCLpxKmOH0S/rHg=;
        b=P/ibJ4yQe4wYeEJGOMcaOqgmaRZp/Pz5CMsu+goAb2PSzQSS+giVKOKG3JP71w5dGn
         9UEFUcOG/M9sFgubcn7W7uft5uLLXYm82h7QW59laq77SMnrEvaBv7QvvDomSN6telQ1
         tvFXex9TBRbhRBmDMVmF/gCSuVbnifTNpPkQgGnb9olnLqag8e6DdqaQBen+TlctxEG7
         /B5vXOzk6N6OKUtOcAjp7ocFgoohEh9PcRAngp4XDsdb9cXKY717XyeIWpg3APTvKf7p
         DK5gw9qG32USVlgvic2kPfzFVc6eETbXUGutGdMZQFp2TOrlC7c2Izosa406mMrrDe9S
         Oyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599570; x=1770204370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dtH0gsaiv63D6FJ6lGxMPX3Bt/oiCLpxKmOH0S/rHg=;
        b=u2VN92BGp50OvhMXEOU2UpsJB5yWW9bEaXBBVs8HMQzrfEzFVP/6sxAgMtVZ5pZLh7
         SAyf+f4oiIuIOyErOf+guQ0oMUeETqPSiWNI8566jpNIndVp7oWnySge9QZbtz2yRK0r
         PcdxzzvfsPkhufMriaoK2mhotsenXw9SFQubTtMIG3WDKNWEJ3N1QeIVcj/h3b3s30VM
         QW3ZyJJ7p+xCnThA6v263avlmMt7wZr4pgn4Go9YG4/II9KqpDSH/2i74ccrsQuF6XX8
         oTFXlTWqHHABckkWW5bZt0QKaEmZdup998NATOZzN5SAcNDSwl8loyz5pCGS7cYzUX16
         KUOg==
X-Forwarded-Encrypted: i=1; AJvYcCV7kQ4gKXADpHTzoA9fg4glLKS4dPWqHilh4m+b12zlm9UsNr+S7nAuR14hpZ5CY4Bn+F8i+Mhto5zAB6LA@vger.kernel.org
X-Gm-Message-State: AOJu0YyggQqXrgqAwv0dhHcoZXgTprmKjymotpBBUH4uRzcVeUnDSixD
	B6hMP/Q+DmSlkeZ6UBzFQFhIqd+NHmnL2vR0bnUFTPISIZlvAiAc70AUNIkhYHTGmxvRcvxajcE
	SeN7SLfnLztu8+Pm9x+nzAJgU3Ar017C8UAzn3eOWSc4HEJ0er6OFt4cwsJyxSYiwtSPw
X-Gm-Gg: AZuq6aLY86qXp8GnKJJppQ+QjwidXZnMCGDMJR3HQYhfHuYPZMh2NGgA8o1sPEojfkm
	i0BPG8TkzOFxpfAhmnkpuTTyroT4jpPBZc5tT8bnAUaenRmO+FXQyM7nEYdtG2xs+pskBijYtu1
	hQanD84JNj9drgho//Kl8oznt8tnAFLkWWZTZyCbQd8AGNCBqxEkeE+xuJMdzMPpMrVVCcQDOye
	31fHKxYds9qRURaMQiQwc+k+c30aDNTtdcumUmxy+ob+C2U3cwAAR3x4DTCGiqrsnMHia31vSCW
	u3TQeuyjpsSCrTttL3D6mDsauNb/pHChxV1I3PHBN4u6yD/a6Ed4FpVgtF5O4TeoTVZIrOo6gG4
	NnioAkHRbohonr+E42SKKMyMfD/9bbwDH83DIHQVaRpz+JOcM6TlEcGRcj41F/oS/Rwo=
X-Received: by 2002:a05:620a:5817:b0:8c7:17af:7ae with SMTP id af79cd13be357-8c717af0904mr41074485a.7.1769599569878;
        Wed, 28 Jan 2026 03:26:09 -0800 (PST)
X-Received: by 2002:a05:620a:5817:b0:8c7:17af:7ae with SMTP id af79cd13be357-8c717af0904mr41072685a.7.1769599569390;
        Wed, 28 Jan 2026 03:26:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm111830666b.38.2026.01.28.03.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:26:08 -0800 (PST)
Message-ID: <37689820-4d67-4422-98a8-d01275cf4904@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Roger Shimizu <rosh@debian.org>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XFEXWJNE0npdV7ayni3v0dkJ6vcnWZ-m
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979f252 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8
 a=6TRhWV5S5Ysso8lYXqYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfXyGL+ZWfsea+d
 2APvOKmIo1VqUgyfVG7LyZugz3z4b5QUa4y1OH5971pnvuNWJTpqdYLBL6q72h7Odf2GsDtECbf
 VleeST8TqvaV9G1WkD+nEGpO6RA3EPtfWiTZMHL5koIpKIaQV6zW5QVMKhTbp2nib6D+y4Hkwj8
 MltMkWkZmxuZKRu1D9QMQvSgcYGTJzuEOvmjef85DTCQ3oRkSwc2FxJzYcsBEMM5lr6Q05KfzSV
 LPCZ8Jwllu5oChD55fI9cvrwxR1aMoTYKsZl6q5qgOTE/Qd66PDnBDCxPsKdWHO1osfnxGGlfdL
 e/eBhKHcv6+OUTARWLE1gHDeBu7zYfCiiOFqh90Cg5jINWVwLB8qc9FxJFNjAXyTRpegnxBnyz1
 esVxfm42pkr0cO5RTAFIaXj4rX8OKMty36IspvCfBOjzJu/LG2XekCOatohyg5VOomSlMRb72VF
 xWRMLogWX8ddE8SPwSA==
X-Proofpoint-ORIG-GUID: XFEXWJNE0npdV7ayni3v0dkJ6vcnWZ-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	TAGGED_FROM(0.00)[bounces-90976-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,thundersoft.com:email];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17812A0884
X-Rspamd-Action: add header
X-Spam: Yes

On 1/28/26 12:15 PM, Hongyang Zhao wrote:
> The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> Port B. Update the devicetree to use port@1 which corresponds to
> Port B input on the LT9611.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---

Fixes: f055a39f6874 ("arm64: dts: qcom: Add qcs6490-rubikpi3 board dts")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

