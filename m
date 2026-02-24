Return-Path: <linux-arm-msm+bounces-93859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M/jId0SnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:54:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A250181284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2103130FFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9EE277CA4;
	Tue, 24 Feb 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjceNW+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6qIEQTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FFE26ED59
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901604; cv=none; b=KKxRB6B+mBw29tc4Ehi8kESniMNlV0i47kRAlJNhK56rN2F06v0NBGO15QHo5JencIaNDZsTuTvAtaBElktRCeUMqgr+cbHkxyXT9kyy0opHj1rCDricUzDc9uNhbELO34ldbqlGp2g1wvmWYdi1Av6xAXUbX3u6J8jhrqpsB1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901604; c=relaxed/simple;
	bh=edUKXwpGonwpAJ5MQCfXzvNimYLCwVqayhEcH/oV6Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6eQ32C2+JTD0slt3kaL9Leur2/Be3+8EO0XHn0Ogoni/rXcoBz8KC2Ca5Q6K1oy1FPeVJwsNYduUnAjk10BGZ+dZEIDDaurMvN/xhCa9njvnnZBh/P5+H/SKO/O4m/j5OoxanAT9sZ3KjU4yetffXOws8RCdj1NJhgE7jtdyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjceNW+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6qIEQTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2lqWM1326974
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IfCInz/Ts2xFQo9brlsDwwgd
	/8bMRGYH2Ks+/vHbW0Q=; b=UjceNW+tFF+CvZz16NhaD5k9b2sGG9i9YWVfQbG3
	4fnSIAlMIR0GmQiwfoiwH7vQkeG+Md4l2G8IDjrP7fRp78XwAEe8xnFBCdedDFVJ
	1cCIfiVTU8si+5TAIHpvVLO0T5Ij2LHIEKcvP1UBTQ5unAxMmn5txXStT8c/DdEE
	wuB0JhwFUGdfaDOPwAQvbf7FbqJq1anpioOIdCZeBPWWfJUPJJV4jx3DwzrpA86j
	wE44JCU+We5Ey6giasZsZPVTKkYZSfLp3WPO8a1/SSOUFtws22ExG1iZ8NRUROpT
	ry21W3Q3vizQrhWc8LmW5L5lgpW0z30ewrhzezeLWJ/ycw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx09g80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:53:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb390a0c4eso2045288885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901601; x=1772506401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfCInz/Ts2xFQo9brlsDwwgd/8bMRGYH2Ks+/vHbW0Q=;
        b=Q6qIEQTx7OEdZKoowSYhKVbPxZY2RWOgmpOa0VcESSTi/U6/MGmwGBtoQ6QINCWfda
         xEI3O2a8Q/6svnzDHe4JaU4nFeQSw5kNEvQdrXzBdI4lqu95v+wY0HD8h6nkf20omptd
         CrpLDKz4YhONl2AkcWHYuDxgNWLclwbroHNyIOaDBb6u7v7wexB+n39+hRFpIMXR1aH3
         wQbhj/AphLuRZFlbkhdqlLpzo86kLy3lRmKbo8LViuTs3Nv0g+ypNHxgEoGDZuJNlWy0
         DMPOBGdTS2vRCY8nG38JPNGsnjAIF2HzIgHjD+Neepe3uM0QXZxhxz3VGmw2Clkbi5/X
         lvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901601; x=1772506401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfCInz/Ts2xFQo9brlsDwwgd/8bMRGYH2Ks+/vHbW0Q=;
        b=J9lH2gL3pRRXu6nkjOVRWl1LHRs3z65IjI4tt+/E3AeM15h/H9/+4frxJGPlxkFgVY
         nbP4C1NUo3W5tzsx7JgRHbzkD2TVA01VpaL5jOTr8MAwbeInvOsZHELe/raPKkbijEZF
         hyE19yjTfFhLY6yOhwb+l20eOpD9ytqd9ms9byKj57uRf2/CTaLybSi9C0jwW2SU45BL
         0ZE89uUMZZJARTRT65B76FnThSY6zpz6z9cHc5ZpW6tIGr8VKGRZYIpjn3idSg2TgEcy
         t/296cPB7GLpHyjBJmebfMXjz5APNKdym2AR+uqTOvpXRaJrln3hSBfcmNhcpbZmnUUN
         rjSA==
X-Forwarded-Encrypted: i=1; AJvYcCVquwElt0cPRiuXmy07EXLRE3eeffhBTnWwd4REedEyUaJ/fW7gs3QQsguDDgzXxMXgL4wwvFhMUb6fsCOl@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPlxOHMGivHJhywn0Va06mWMiK98+xQ9jmYg19n7aK8m4e7+m
	aQi0ldCZNiOvumUlikFhAt/vwSVsYIGxQTIXxdnsTtho/fr/BKU07yyAycpz4LXY0f6Hi6Dkz5H
	S3Aifxjel511MCA49DTu4nb/WYz9TTQM+ju9hsbt/j6wGslgsGz3c1Fh5G5iCh3eOlrII
X-Gm-Gg: AZuq6aJ0ZmW2cQJPcr/ADymvRY6RkcA4DBGWORa8ky0aZlWN7nKHClSkbaTHlspxIAA
	DfE2LEGbpLW01wb6CqNHASxGnyddeQC8IqWlOJuPiGkNWW+kGjjl8vPNaARDc1L/JWqXFrWyFJ9
	RRwc9gPWcwRhP5s0RHENCSpRENLe8UYAGjO2O5BR8ncT1vWkCk1a9/UjzyKRODtI3gRdmszaK8p
	lTJonwFZhCQ/Qoq3yJTnYwS2BvoDu5po8T2/LrsZ0Gboa0pKhUDy2Vp3ierqge6hqCoX9ku0hLQ
	M4+6Y5l255umW2mVepr17v1gUasS2R3jsN9rHUnG9Uxp6IDP9Pf+gHm73tIKV7gFqyIf1z0pAss
	Srkh6lsp8jVAJ/mZhUmsZS9tKkqT30PuJuKjA2Pv+gFIORvp+1yGb/Kla9jowP6JO6vF97XZh4L
	aJNkIQPXZ21KLqx3seetmI1t+h5tepHLNfflw=
X-Received: by 2002:a05:620a:1a17:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cb8ca63f64mr1390870385a.43.1771901601158;
        Mon, 23 Feb 2026 18:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:1a17:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cb8ca63f64mr1390869085a.43.1771901600769;
        Mon, 23 Feb 2026 18:53:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45a59sm1888486e87.68.2026.02.23.18.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:53:18 -0800 (PST)
Date: Tue, 24 Feb 2026 04:53:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb2210-rb1: Drop redundant
 non-controllable supplies
Message-ID: <t5ub7xx4dqsyuo7b6wtjgdf3rqkkuj6oaga6u5gtcklonwzz3d@lfl2np6itqsu>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
 <20260223-qcom-dts-supplies-v1-3-f90ac885b3fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-qcom-dts-supplies-v1-3-f90ac885b3fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: t1I-ckg5n5NEcpNdS7m73m6J4TASeARx
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d12a2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YQIQ00YL77e8QyTPvtEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t1I-ckg5n5NEcpNdS7m73m6J4TASeARx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfX7jsgaEBL5rws
 mHoVbEhn+SA4iOPFbI+3gQ4d0Nm4PoqanRe4kxFinpajjHE7//FurEgGXIbURpyftFJoQD1aaRq
 Sljo6rVJVMuWwjm2YJyR629Wfrfole5xEN1eh4EsYU2N1Ab5hDBa2/Dl12wVYi+rb0t4S2nItxl
 Zpn3MzmJGU0NH1OfIs0f8af06W21+xnIOOuebIxsfU08w8ttMH+y25zxuzdamhYOSjEPvMPKyaN
 v2zi/4s/nOmarie+B/QcUfnVH+BaKBbTMza5CNbQYzb24iPEZ2Jy3ygetKoM56KYrloNBPVgLv8
 Iinbo/KTkJzevy7zk8nEBfcthJuZHljTIdW9idGdxCbntjSbBjDkMHNb7TIrlQbV6DU6iizrMn5
 QMcPMNAftNuPevMT8BQ7ZsWiJNUFoJW8kGqT48wyRjKfOy5xTC/Agss8VOWwlDlOED8OPlVGW8+
 HZ+1sWtGQeLwl0nz2Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93859-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A250181284
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:54:19PM +0100, Krzysztof Kozlowski wrote:
> Drop completely redundant non-controllable chain of "regulator-fixed"
> supplies, which serve no purpose except growing DTS and kernel boot
> time.  They represent no added value and because of being completely
> transparent for any users of DTS (except the bloat), they should not be
> represented in DTS, just like we do not represent every transistor
> there.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 45 --------------------------------
>  1 file changed, 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

