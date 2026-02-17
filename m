Return-Path: <linux-arm-msm+bounces-93055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2pgyIssalGn//wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:37:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD214936B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87D2E30066A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652A42C0F8E;
	Tue, 17 Feb 2026 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJggXVMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC6VelIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E933993
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313864; cv=none; b=hvH8DlRUnZ7p6OXirr83aBG8BMUg6tRFJiw02yt05mDIWY3WTyx2N81T71JmSceSG+69fY2YyGBA21Z1NlMwmbmXWaz7VZsnkuBaX58WeG/Hp9CYT6RQ+xHVCNq3Zml0c4Ng6dfRSj2AxBjPqopW7Dfr+gseEVMmtEFBPfn19IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313864; c=relaxed/simple;
	bh=pkL7neZhdXiS6911Oghk8JkjG2VoWdHSi19S+R2hXDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTe1CJNmPQGdXqod33jr04QOS+mn43yTlV67wlqU7bmf8DSTOivCnywaYoip+WNhOhU4ugQMU4WvO7GRuuYkVyVvSZzMc/QmDx6tfT/C6NtNZDq07w9k2bNVn7sbsiebO6IDXDyino4RnLqDxxDyzTPgX1MAg2L0MAs0yW0cVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJggXVMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC6VelIM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4NOE1545010
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WPYHukQZC9sgqwSj6rGDXxrk
	OZMyrev9mk3G1zXEtnA=; b=lJggXVMVdBbzgMdMGVZlITZDjtQ2jKWhiVYET+Uy
	7gH5bNu3RTc4W1rXgYdrCJ6q7MYcdsoLGTBGF9Vtt65gcyqcKv+YUTQ0DJT8+vyM
	XhVZHendZZM5A6kWM1JJdC5qUOp03AhErcYKfqztopmGQPd9NmtY+lO9XWGDCkAj
	yoth2ngXl0pk0oYARJTJm8Z5DsguNGiBfvH+Z+5hiq7XhiF1J2AD3tF+TUCiaDns
	a52C59HjNZ0yJGWPMqOHxMdsAOmAdm97xRqShzEyhevlKq4R8Q3xbPEVeyp67olE
	U7+V/sOKzTxBr7Fdn1/Ezg6rUOr2s0v9Jtt3um05aL5kNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajscvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3d11b913so1993861785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313862; x=1771918662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPYHukQZC9sgqwSj6rGDXxrkOZMyrev9mk3G1zXEtnA=;
        b=dC6VelIMTK+EKrYuokdQIovaIS/umHE1hDxgYyelbdPBxRPXBhex4OND82G2+W5Tsd
         jUghzUIlHXpJWqzlcq587td7DdgE1gCwqtjgpHYzNQ2M+YdtFAI9l1L4uHyCRUN5/KQh
         ofsfjKllBXMI0I2Ua6+rIsvxttAGxDDAFxqwRsm9/r+QXyT1P56kQduexBnPpdGQtvwd
         uWJwIzQXSWrSqe4SP8B+dX6cCcDX/x1lRdXoRWOUYnY+mHte76V+MCCH95o+8qJZLzIg
         Bev+zRfNGFCuQCk8KYB0fN6J7nh8qDftSqZZVe0wd1YzyanNIZKjxZGgDYawM8RSDsPd
         GBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313862; x=1771918662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPYHukQZC9sgqwSj6rGDXxrkOZMyrev9mk3G1zXEtnA=;
        b=OlK0WqrhehxYDjh6XUR3H+umyPSyoTd0Yx32nPZYrd+Sl/kiy+V6R0t6LkbhYTW+eI
         oQZiPCSvyYQF/0x/CQORCkut/q1xfYxxDLyjyD5eX6s+1aHXd01WNKuOMMJYniJxg2rN
         uDvfJA3EQR5xr1TIWvBAJ3E798kdQ9rRVJNKNLitfb2VKKWpJAb7vDv3QXbGdzG1jJha
         BIspGHRmIH892V7vhBc5RNdTd6eX00XYu+b0Ci9Or8vXKTOM2lCBoaOMWi75FABCwgTA
         pFuRDTxu2nsyCgGgLD96WnLB4uDzVwyqYbdMNPD9bgbpvUL3UCfge9rtxi3h9Axex2Cz
         7J9A==
X-Forwarded-Encrypted: i=1; AJvYcCU4Pm9mYQrQbEBijiMG9DXHiKB/HSnQPRjnRGI0UF8UIg7w7cUwI4cqsSvi2RJoiX6ax83v0ck2Yp3ASaeM@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqUTAXev4Vw0oIag9F/UlITTqMo4oa7TFRXWZ7J1vL0zCuvSz
	kcbenF8NMTBUeJwkUKGVLf6RfCDyyh8VrwZ3CEfYE2uQ2tpCO0xf3RbdLGjAq0bha/Q4XCecTpB
	rjMenVAD1CrFOVnfgF52KsNIYjt2kgvQFh4i4FSIFCM7d0moAZyUVwhz6e9w0+FE4yV3h
X-Gm-Gg: AZuq6aKJdz1U2IdUDQxMxx5ujEg5rhXZo+nQTR4wjlWtu48BWbIcPpOrx06FEKMt1mL
	DU7cxQMurzbSecGx6QM3C3zEmwuY71weLvC/2qDKOmMdMOSfbAS6gDCE/0Ex7VveZNF1o004osd
	2SyUNusWZvA23MzffS8//psVAObGhWwVleExt0eHDsy20ndgwP1glVMKwEb2D6Xp+PodrKGXxwA
	wngbYbRk1SVJB4ij4INaDo2z1KnJ+S8okblo7aqjwB+/d+iEi2FiETzt3auVXY3znXuV1Tz9hzv
	sVbtl1zDkCGpRsvYQ18xTgvGabWphZIC4NARZmXx5LoGFvLanPUEui7jria38rFDAZFZtJPzXkT
	78KAiIyiSQ0ihy/p4vd/k0z+8HHaN7+w8YAx7vhdabMI7TKFfJBYW5kGjxvLVgbQgWE4NRWFnyT
	BVEpxnQViPEii/sTwpyHWhOhiU0l5PzQMa80Q=
X-Received: by 2002:a05:620a:698b:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb42461865mr1581137885a.67.1771313861543;
        Mon, 16 Feb 2026 23:37:41 -0800 (PST)
X-Received: by 2002:a05:620a:698b:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb42461865mr1581136785a.67.1771313861138;
        Mon, 16 Feb 2026 23:37:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56a476sm3699312e87.32.2026.02.16.23.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:40 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
Message-ID: <s3ym5ua3ppi7qmkzrlxmlzhfnikeszyubmrsrxfyormi4d35c6@5v63tfvt3wmr>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-7-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfXzTt9433/v5uf
 4MEktBjM2SNhrnKMp9/R8pLuxkvdziQI00DJmUFVGB/HZDIJmN9gFqBVU7COvX9Q7d9Ebg/2qDC
 J/fVtZWGiXjkNZOTGJqcMqbJFtEX4sXWSCAoAiif5/c5yg3g4YvU3GO6Y0ufavzY6H1WSNL1YH9
 QchHX/weepQ1zLtuJ7R3l+V4M5jLAwzvcdNha8io5CZ8jR19WCy30lPE5av62FOJUloTZIK/VAU
 ukiwQWZhWbZRJHMeNEHUowlpJIlr474QL0RXuO0FjVPV44a7k+Sc8oA6wqGjzjKduhIRQpURPxI
 u8v/1NhRg9d7k7OFbVZtAqPu/EKTZu2+ZT3wh7LIcCW1vthZjO24/8Kg5y2+azB4yz4kLHH3se8
 TP6PsvFuNvfrxvnFncvY2POTKY+m7tMP4swnLmKuZwvJznmDfdKV1Ma+Ts4i7d7hvp8iKz8GGI1
 SPyOmoC+Pbc0Og0WoLQ==
X-Proofpoint-ORIG-GUID: Fm6lYcfefaif5SBTbN0h-vYot_nRTdPn
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69941ac6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NQfNVa4L0IZK2tGiTpgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Fm6lYcfefaif5SBTbN0h-vYot_nRTdPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93055-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BAD214936B
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:25:23PM -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. Otherwise, unpredictable issues can happen, e.g.
> on the motorola-guamp smartphone DSI would not transmit anything.
> 
> Wire up the reset to fix.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

