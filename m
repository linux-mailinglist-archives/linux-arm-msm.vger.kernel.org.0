Return-Path: <linux-arm-msm+bounces-108973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHfdLpHIDmoHCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:55:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F535A1945
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 227073056BAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F20367B7F;
	Thu, 21 May 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRm4uhJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kn7OzrEx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A736683B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353598; cv=none; b=uk4IVPQ2FkPOWrfY22oawAPM61AhRKTUDGpwXbJ35+y5q0rR2o4FDYcbsQWqInLjSkCSvclaibw4se8J3I+hwo066KFpwe2s9zF71H7ZZE//L7NtusxIQcbDw5ZrloN3sDO9VZ7c51UX96YrGn9yAp38TyfEX5N9d5Pe7slZG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353598; c=relaxed/simple;
	bh=eGD1n2Ion5p1/DHY8IcJMRs8e/fMsqdh5ittH4YWLhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cljhCSbjYu513aVcKKxCw0O8bSBL7hEJpEbkgqdCRQxOJr9mko1cO96Isc4p2FpMflqmK3SHvkxB6HI7SzudFMzOs9c6yo26yICaiSlM3qK/iZrtHiL0fgdx2YJ1GWk6l5NdahH4guR+4y/rgQCcTEHzScI3lKHb74k99uf/vTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRm4uhJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kn7OzrEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6aD0n2157896
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elzPaWmOKLsXoiTCtcan47fSW0zgacEY+5u9ATsGPN0=; b=GRm4uhJC+C0BghoO
	xgoXnCW0+nOegy3A5BJsr/Uo7QveiulOO+hu1TjUf2sym106+1XaKJnpQxNOhjfK
	TRstywF8S4JJkXLrbHpTyebeyftvFsSRd+yAIKMwQHzoXPzq+93wcDr2nESMoSng
	E5Yl3c4WI1xxKEquiCcr1K5P6Q7FQv4BusnTQrBK/4bNicVa+cKt/L6sCy3fuABh
	69KvScARtw5RiCUDd5oxvBdgBsjuB/hm+g+6rn5ERoojPec+3zMRdRIARc6kdD8q
	q/loxq1+N3OCTQyBOE7mfePMn1sPqy9XDqhhFYlRtHDCV5ck1CtzjENsN63bRW3O
	KdwDwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42b5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:53:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90f04f07227so147353285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353595; x=1779958395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elzPaWmOKLsXoiTCtcan47fSW0zgacEY+5u9ATsGPN0=;
        b=Kn7OzrExCIu2bqqW/6kXjcc52NlTWoIsKzO0TX5Nm5mh7KxIbU1IMmO8gGP5z23xt/
         02ShlK69K9blWFuxqYEVfqDG8MOZHcyHe0npYe50vH2t0VVFBDoZRI80hQl7/8XThOgU
         waThd/tU49n6X5jxfF2cX5ejnhX/moHQvQs4o/R9uNUwOxe5kNugiaONVum7soNNxfDZ
         oFsps1kEjYu1gpHdvny+iP34aKNaz/Zfun/LEUJYdTF87tZ9flpCJy+HR2xc0QG5rjlk
         kFU49fYwSdo3jYhbbqzW0JhjVQ8MOTWKExeXQ2jg5JSPbswmFKZhCs6d238vA3NNGAqh
         6OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353595; x=1779958395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elzPaWmOKLsXoiTCtcan47fSW0zgacEY+5u9ATsGPN0=;
        b=LibB/5ZgK61ERjYuT124FxuSSYuoRqqCQ1NqchfPm8qYXKZOpCU1LaXWoT2FtPoy4s
         n8qCHoxvMjG4uHWnel3Hkmr1yyFfAv7ao69ELO7rAIi0kSOC0F4/GewIOFij5X82t5Y8
         jJfiyuHa4K7sGFMU4VAjD6Y4vap0K6ZQ2zU+rtbJP46317Q+nFgVrY/b7mlBVfGj4gn8
         N7BVe7JGmyMzQ6g3ibiH23ow8/+e9Vjy5FctMzsGU1TfJD1tlygBTmJ79pxVW3d/yLXJ
         Qqz1NICezqxkRmKXRJXNyLmdKIvewlIGFGR0TWJGLgLxKMac9XLUK9vGngguR13gyirR
         E2bQ==
X-Forwarded-Encrypted: i=1; AFNElJ993I3oGTVvwry8mWicmsjqmPqBDbE6u046sQyEKdc79lYrLQ9QAZR7gExQNyYkQTWoplAYo9lYIvHIugiz@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHicZpd7g+vWU7Jn7gyU2gIvFT4HqVDy60nQc/bkKzcWjyIcC
	9lpb+Lml2TwgBxPgOUoLHDOsM/+1JWU4pu/QrnamPME6hkZ0NPi+kg3qMa1dKe2yIX6HwsNCAYI
	Dpze0YNtLH3TiLMvmvAyFlcdplwVzVpJV9SGIWgJNX8ARCZx6Dn65lUx5mIdu/1r1sWAiRPuhtA
	Gq
X-Gm-Gg: Acq92OHATJGbmJ7Kczo76x5sVWARZMB+CeY2EfPbeztQ7CS4gW2lYbBLim1+ORX2PY2
	x9cbFdnnk9qbXI4Q17JokiOkPGP97mE5hlVLQL+wIxYIkFIYxwyWrbjBrYvQzh6DdKfGmjgTxG+
	K6OvRPKmMu16O1C47Z2nGNIlCaZOAClsmQlDwpjLzedTg5Vq5IvFidf72E0dNPxVCflqAckKoqz
	ODsKUKYjARnZo5NEPSmQEG88i/nozRf4bVPPy5BvVE4S+/qdSTQJ3L02tlfRpUEJW6u6IfUVas6
	4IGWAgw7jx4wnDkazKiPk8kavlerhgAWH7hZ5Mt+0cOgWJwgQqCUL7mxolP0EcsxbJ7GdExvXIY
	x6zByuyBZqmkq0KB1K40RM/ysiXm5QsNslkwa6/dpAbebELXuUjapb8n4ia9oycKaWY0iM7fPY+
	5Do/M=
X-Received: by 2002:a05:620a:2909:b0:911:e556:c7c5 with SMTP id af79cd13be357-914a2d1a4famr157591785a.8.1779353595208;
        Thu, 21 May 2026 01:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2909:b0:911:e556:c7c5 with SMTP id af79cd13be357-914a2d1a4famr157589685a.8.1779353594684;
        Thu, 21 May 2026 01:53:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6882442b03fsm572015a12.12.2026.05.21.01.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:53:13 -0700 (PDT)
Message-ID: <990a0d6b-ef5c-4d7b-ab63-e75c37825397@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:53:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP
 alt mode
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec7fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3tLAdUXkJK0rNdSNFTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: j3VjPTmKjagu2mZ4bDacWyCNB8OTZsE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX36x7jiYxSle0
 Eh2BcmpMj23UJy/OeVn00rr+OE+0SyLbXJSgEIs4PNdKkj9iVxkTpE/b4PSZ1RzQU6XG+RctNC+
 C7lOhtuupWsEMEXriQ/xYK3t0hTRnywz5fV9Oei/WejlDN4xN4Iany8nXO6TbKyB2vg+/VtbzlR
 f5FVMu5RtrfVAYuED4QBN7dk49vHxFPbwlgCzV0x5WeAQg03ITZIgZuP+YqgsFLOHamI6ixr+b8
 +XQRoRSiUlNNhtq33j4im1Km70cKGvV/o5wfrKd3D9TRY77YGWNgPFb8ab87IjH6IHoXdt78VR1
 gco9QEmtdaQnJ3brLEldSwyvR9jXLMpZIkI/F6g8+eyMNMBmaiDJ2K/+c5oeeoOTFKOFaQBhGMC
 CnH+NAXVnNzwCoSuPL+4MteJuzi1ikMFzVHj8IBMOH4EvUHiAccK8getvKgkxBlLVg27rAU7DSi
 yOkCUH2PbVgf09unQGw==
X-Proofpoint-ORIG-GUID: j3VjPTmKjagu2mZ4bDacWyCNB8OTZsE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108973-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oldschoolsolutions.biz:email];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60F535A1945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
> same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
> working on the Surface Pro 9 5G.
> 
> Investigation [1] by Jens on the Windows Dev Kit (WDK2023), the other
> sc8280xp-based "blackrock" model from Microsoft, found a reference
> to GPIO 100 in the DSDT in addition to 101. Switching to GPIO 100
> fixed the issue on blackrock, as it does on arcata to enable
> external screen when using the left-side top USB-C port.
> 
> [1] https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/
> 
> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")

Fixes should go before your sign-off

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

