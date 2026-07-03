Return-Path: <linux-arm-msm+bounces-116278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJjNDVqOR2qnbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:26:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3D701328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iJxAZ0lR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J4lVQUQO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116278-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116278-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F39A3007BB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA598382292;
	Fri,  3 Jul 2026 10:25:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C9E56A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:25:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074307; cv=none; b=nj4FaYDOC9GS2TLjn7wZ1wpqY1+UC8ZELRCynvHHIiCXM7DyiUz78F2CqpWvsSEeo3E2h5Y/roUn6zfkc2f9toTmu/MzL6c/KjFJnQubOn1vvuACrUOplEOaCOZB9iVjitiqgnnTvg8brGP2TKOAhI/9PFoHgUe4tDONgh8MWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074307; c=relaxed/simple;
	bh=qFvZLNREbSpOF+NiMhblUAB7z7xJQekjfCTZF0fdOsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIArun2O+akQU9NDlrNoe0VcrZ9YvmLohY45EVxqNv+OYpQw/K8VD61VvrLH/S5gD5YlzDDGfcNtJ7B/A3+d4h3UoCEEXcf/buNhGp0CULt7+N+SYPkuqhulSzIWT24O7U0qDKu6vIa6HRZyl1SMvHrJFbmYheqHnbfviFGG/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJxAZ0lR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4lVQUQO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635ri0f3134735
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=; b=iJxAZ0lRy9VMvl08
	AswHq8gG8SVa2G21u2tYKvVg9RmRMC68nB0h4aZiGIs8q5x7RLADvxk/1BTMAjni
	jU+M3P9rB5BsZ/wOiKw8HBPZpm3lTWVqxY1LrwcZSNaw+43m3FNQOrf5GXa8R6BB
	kQfK4Ga6v7Bem/tCLOqOiAfOHCJLwWFw95bUhaHzJclBkWs/nygbRj3COWB1aet8
	NdbXdVU5CfQYp2flEkVGYD/NWyGYP4hayuLopwG+XHMJ2WtXtwC1T3k4mlMZzy6y
	u4AWbpcMYHNEFfR78OmHrYkC3RDoe1Nla9na3y6xI/y/Twi8jTG5Qt3+Rl4E4cyZ
	55WlKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qchk77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:25:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so1375221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074305; x=1783679105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=;
        b=J4lVQUQOilE3Wo6Vr70MEfE2yidNDubtA3uzAF6jZX2s+quVXBZsh6F2SPGhE5SWiK
         qBh2Y5X8Dvu6O/dgLrN6bHZVucPmp9myVvrMSqWY16tAjrlabCXuhzClAmaNQCmAggfv
         aArMaSlZkpnskNdJ/xv+Bn0nuZrUng5XvIH1eYP4vW7HoSY2bgmqwiEXkmcDjwkmNlks
         o3D+BnNhzAi9L+hyUE8hSQZh6TouWxyC4YZf6mtZgFcC3d9js6e3xFV3Yl9bpXofKtDf
         bMawitLkzS6o6qbewXrUtqUNy7hUKo9jffukrdABXUVr9U8GwbzmLXmKQMuE9Ye686GP
         lbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074305; x=1783679105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=;
        b=CDbppZ/H9VmxQHdJOEIablD0uVDOLa7fJ9cB9D1zvcjnwoeYZOZiT4k3qhXNueFHGu
         t4c72bum2YJfhDcKGblK7UwvntysAeZuYtuP6gmbmNXZbl/XRFKdyo6Z+Ex1N0+hVtGo
         I2Hql10pTnxQ10bkLAK2p8cNije67VigY0K7itwar02QU9YdFp+jvqKBoGUYwTtKpP5r
         MHptyJ5XfWN69aXk/chMaOCSrTbsZSnaf5ruSvTph7Bd0u4NP5oZB3uYCIlKpbZqUX9I
         sY8/K+RK/YC9i/tNimcqdZC7rx0Me3z95jRMK/Y5P5RYNdv0JnlPoD/D1Zro/AS4vRoe
         QgFA==
X-Gm-Message-State: AOJu0YyB2f3KDZS+nb3QZT+y08WbXZEMzY4xMzaBtW652WCy3LXomU3B
	8qepNLxQuvWN+2/jSnu+Wgq0KCPCYvFk0UPePm1Eu+z2Y9wzg+bMzc/AiveUYr9WiYOoihVsq6K
	PQ86d0w39tea+wHjAJELZ5VOSsLM0RAMiyP7KhqI1oFeFXsMTw8hQVZ62oYyfXicrOETT
X-Gm-Gg: AfdE7clNOZYyMepJ2sbZtU/Eq2R9ECi6BenQkJPOSVLpDGYdnc+BYMwAz5p1C4sADI6
	YoN61weF9vd0WbBg8ok9yCoQmfk9N5HM1vQ2EXFANvGznGRW3RAa2llDoqJuu+92vm3LptzUkA6
	lNXGr0e/mTeVTMwic5fY/8aZM+obeFF3Euy6HjZQAQKH69nu/lgjPHWjJdiOR3Pc1vXH0lV0C89
	jS1aPPkf+16nqqWDdJgbl8S0/1hNvusVg9VAahMoJKqV3aCzf8zMnqAUEzvG4iWTCAlO64SjwI5
	wURRUlEl4gxqasiDZumSjnm84obYcaWBGHytvGIxBshsBryp9kKaVcZs2PlYjDVjLiCiY0PO/Uv
	JiueFDN2X6jYG6bLxcRZlVBHoAANv453YV08=
X-Received: by 2002:a05:622a:118e:b0:51c:2324:666 with SMTP id d75a77b69052e-51c26a6b823mr79308841cf.3.1783074304698;
        Fri, 03 Jul 2026 03:25:04 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:51c:2324:666 with SMTP id d75a77b69052e-51c26a6b823mr79308631cf.3.1783074304270;
        Fri, 03 Jul 2026 03:25:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4a72sm262349166b.43.2026.07.03.03.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:25:03 -0700 (PDT)
Message-ID: <424aa2d2-aad3-480c-b63e-bc557839971d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] clk: qcom: Make important ARM32 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
 <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JwJ2QAGCgjOydXgTGAugEfADJLk44Td3
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a478e01 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JwJ2QAGCgjOydXgTGAugEfADJLk44Td3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX9VIbxjDegCk6
 v4IVjCgY0GfZrFSUuw0jkrSYd4k20T2Z7ECJzi5BO4hihB6wM9+C9eZ2P0aGJAdMDeSD5Fvnc4N
 0wy+NVF3OBMfWiVT/rdVhFll6XJZYvrE1qgRP2TcEoblJfucttjD//x0cMWxZnxWvjSddOp3PAC
 OwpMkADCdn5OuzcUEvgPoagFYN4XwrWYHHIIXwygYtB/3p21bLlSRSHgAMiepsxE2PRMGLRYNna
 tZJcBkF50s5z4UdgL9JnprpBt/ZNU3Cl4vnihZuUlMhG4QgKwqYbfIONRFler/oHpRgDlLMjsiM
 R6/xTbkS9T++bUiO6Tq2jEK+kUyhoL1YfKAg95OxBigRlxp6e9ChUQcDvUjj93jWhMwNclythfI
 yr21yd7KT1ODt1w4LdeoJWcyHCvlEiSQHaxHSvzXHa1AUODcxA7izHxy3I84ZePth71hX30v7M+
 5Zezf4si9ClyBJwUBTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX7qoMlmUjigbc
 H5frHJG42jvqUtaviINMxmUkhuTfca/AxvJQ0tcchj2UdkgmD0xvSpoUhgBLvvY5pF8FkabB96C
 5oiIDtfkx8YSYk6k8d+TN5eD6+o1HPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116278-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5A3D701328

On 7/3/26 12:04 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> ARM 32-bit qcom defconfig to a default 'yes'.
> 
> This has no impact on ARM32 qcom defconfig and ARM64 defconfig
> include/generated/autoconf.h, however enables a few drivers for ARM32
> multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
> SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
> QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
> these SoCs with defconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

