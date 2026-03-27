Return-Path: <linux-arm-msm+bounces-100275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLzGH/JmxmnnJgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:16:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F3343339
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D209B30FC2EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902F33EBF18;
	Fri, 27 Mar 2026 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLIOKGy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dN/PW56b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79363CBE7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609774; cv=none; b=YF27LFlqEragpc/Onrizz9zOzEFWY3gu6BOO96tDAdaZZJapPONY85kF2dHbkAHv8SGM9IGI9ADKQ42EvlzxB0+48lYFXAF4434fr6ELpsahzGFveb6RrqcDReocY1mX1TZoXnTAGiFsh+BDmGj8rpQIzBwdLBWXvxngi8UtSXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609774; c=relaxed/simple;
	bh=nqDbSWB9uFpQcEl5dGVhJiozUd8PVgjNGSp7ucbBGys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gF4f2HNXJ7J1kHJDVhKagw1Q3e/qkTFVUwyD689c5Q6Mz4kbyDJUskdSccnme+dk7jTEbDhSPAEAVfXiRYncm9Ed2QFnQg+m4B93XqkDHCMEu+SGh9+/Z3ZE/WxD6y5viYgpzvnbaIEMIP/jctfWIuosm9HHBo9/3sTJx6IRRwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLIOKGy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dN/PW56b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3hW1860238
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxItrxDuYz59hTm47Ed3KaBPbLn1WnwD1kHgQZB7uYY=; b=fLIOKGy6ymkQfNBW
	/Uo87F0UZpNHPRcrOeaqS5zvk2qjKebOSyqRYhxGEJQB9SexhSot6HJV2zMdmZnK
	RahxThQ1oi5W2sLjDxqCS+wG2FJ70XkpSGFXlFM3vMtjmv6QbHR5rfVjxMcT7T5F
	0JB0r1zQhEZ0KKlaSQoKU5ck9JVIH4o2bcNK5/tPU0WCVkTF03UX5mT7BMthZT2C
	fTkaaq0b+pVwbzgGrlpZYyAD4siYi1MHHPbl9/q/+llAKccCIPY5Ih7Cc88aVDaD
	OjdMMNb8ePyEw5RvMbJRUAleXwqZegP3SQXVbYYNW3piwYE9P7Z/WUOKIq2UojvL
	NqM9Nw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2rbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:09:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so6428736d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774609764; x=1775214564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxItrxDuYz59hTm47Ed3KaBPbLn1WnwD1kHgQZB7uYY=;
        b=dN/PW56bGhlXbxTpmc9h3UnWk4TPA1+hAHyaaTJfMYJD15kbeTAtgEMMuv3cDYM6dG
         0GJ3kWUosw1fwg/QI/YHlq4yZUgGcQOeN4wL/zWjF1R21hiUFhbXXW3yYnXEkvEVvOFT
         xDqStmsXeYR0ST/SRkqJpesgezzJ43LNeOGq10SSevjt0L6ebdIazP1fMk5/DTdeURwM
         aZgCFj/6rYEsEA1DOCwai7kaKON4JoNjyN+m1KJkW6pwRb1S8lHeUnY1ccnOAQqLyX32
         EQuAxquqy7BFh3TmpM7hTmJ0ZsM4cZ9Xn/bZX810mBX4GQZVQpr87ss+RY68YGc6ytSm
         dJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609764; x=1775214564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxItrxDuYz59hTm47Ed3KaBPbLn1WnwD1kHgQZB7uYY=;
        b=MamVijiFELUY8OzY6x9BcTTFBHowxz+gc3ArR6giLQP67WYpOGcnPbijbRd+GNdIla
         Rj6TnRkm4LKcOLYMOTTdi+lVj+tLGVZonEQgEfbJYzXcX/M83QHB2WhHTPnwcQL0JG2i
         maNkx9krpL4eydilT3Efn7lW7Wr7ZJ6k2GjHl2ym/kIsWF9hZXsmiVmNUG+j6PqOr5uu
         I3vo6LPyVSJCa97sKiDB2sOLKDgMHGO/EdeDqRq+yGG4oKyyEtNiz4Gsz/+8iktYbV1K
         kAU1PdPgw5q1Ay2N3k6/pm9OsU1LDupUcj1ymVCRFcYzWtdLccuIipe3ovC4RfQUXfmR
         yEqg==
X-Gm-Message-State: AOJu0YyfYe/hVkEoTKnKgVteoTyFmCweNdkIJM/TALikfqYN28YYuwZk
	xMIzWC2y3svoFeLxNWt6u4JXWye0YJjZCZlrkGyugdeLH3uKg3RO5TVlslPaSeIcITs9r8cuyqm
	DfnzRodUZd/Gtg6WKu1cKeU6MSetwd5WdsWkUWVW0OyF73tuqH0dPojI2xZIP8/nZ1/jX
X-Gm-Gg: ATEYQzywSCXcTL7PDFCp4J4Meh4x6lYP0J7nD+6ABheLNIHdzHzIPQ0GZFuaJ9pl0L9
	eZ8wF9xd69pXUpi3yobSCsgrmqzRmqofKi2V6Z+DlfLgpRLR9gJ7RQlBbZFoxhXUrG2a3DfWjKM
	/ezIz1fFJyiamlV6duYpoo+M8DL35Yq2s//yiLCr+mrBDGDNAFIBt/7CxSS4vwslY9476RlpJgo
	Q++mRmG80uUWhOd/5jJHES4qDoz5YG3D/hOhxsJH5jhnfQSndM1EBa8xJ21/3Ky/GUcM/g9ylPm
	84AgAcgMRZcasWoSR9yFQPLgOGVYlXg0LvPubKcm095FNa6jyGi3ubklAcxUtWpjJMRbPZOO15x
	1yC7t3mpDccr21IZbb/S+hF/jy/QSJSa7jJDTfZaN+hNgFUw+wRF7OcM9Q9l5bwb0bMczu+Nzz4
	ja/UU=
X-Received: by 2002:ac8:58cc:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50ba39a9dc0mr22325821cf.7.1774609764412;
        Fri, 27 Mar 2026 04:09:24 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50ba39a9dc0mr22325391cf.7.1774609763948;
        Fri, 27 Mar 2026 04:09:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2044274dsm230081066b.59.2026.03.27.04.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:09:23 -0700 (PDT)
Message-ID: <08e43485-7570-497f-9f2f-1ce4fc7ed6fa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:09:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
To: Xueyao An <xueyao.an@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c66565 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: xg_rA6y6ngq57B1d08FnDJ3oGcnCLr8I
X-Proofpoint-GUID: xg_rA6y6ngq57B1d08FnDJ3oGcnCLr8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OCBTYWx0ZWRfX3qDdI/ZtG8tF
 yyPAhf/AX98hInfuXhOBV7+ND4pNurCh207u8RwW1Xz3qphJc1QRcoLHuDEvqAQGCDgv95ZSZ4b
 bJeBbLmYq8EDOLSJ7/t2i+byOSwprZ31tE/yyR8r7aLKYnu/ymMbh8diPvYH2y8uGEKfaN2aRxp
 1Jh9fua7CesMGQdh+bjPrjAusAcY+7lv11q0CoM2SC3TE2G0v9kfdx03i+csvxS3TjP+cCMHBjE
 bz0rIVY2M7xaL9qXVXbDtDTxfwMnIuwYmst8Nj+oAw4O0ixQPml5h+zARvapYZQTFpmtfKFxdUS
 32T+D7vN2a4VWNSwb9JkpQv58uleJ/5spUsrzIBdzwUtUIV/TKFKJ0emNMBZH8AYC/sbRZPMyLF
 sDE2yZuTIz7jqgKOtIhD0D/aeSNfaG9PhkZzgS4XN+b3g1AjJkwqIIt82iQkptBjjR435+K3Ds6
 YRDZFRkVAeX7jVfxqag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100275-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D58F3343339
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:53 AM, Xueyao An wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

