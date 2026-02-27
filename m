Return-Path: <linux-arm-msm+bounces-94378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aTP1G3knoWl4qgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:11:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74B1B2D0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6EBB300C6D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EA83290CB;
	Fri, 27 Feb 2026 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ddw3AbA0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy/34eVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D385301701
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772169076; cv=none; b=cwrmu62x+tlFB5bIJLHG+mRFolpijXYPyYgpEipgiSNWu6zLz8l4mw9I38oarBmpDm+Wn3uEZ0IIXLDBVeIAK89A3uBP6z4LYSYoyV81eTz3jGk+xMZrcGI66OLtFEhDT8B3aVaB8gcv65pnPUBlVUi60RBu8Bbx65i19nyZ8aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772169076; c=relaxed/simple;
	bh=3F/EcwHaFt0a76T9HICVws+HVQa/bhzawNxJ+UmegzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMEO1feP32A9NpG7vxEqeByzXups/0n6dY6HyL6cYAtnQlbee/T9z0DfNQ2kaniyK8VIFO/jg2PipfRWBPDpqPDp4KXfyvKoEiOdIBRz9wvNuI1Tt9t8yNvjiLMrlaarJOoBiv+AtKQ70TJKci6JeAPfhaz4yKYDtuyBlyZ2Ozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ddw3AbA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy/34eVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1E81620051
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjJTpWloqr/bJjbh8x8C9pw0cFKgkVI0nle3ydeuQNQ=; b=Ddw3AbA0MFg7QDtd
	UlT+ED2OxGmgfzI1qdepdtkxliMt9j8zZCrKQJMq7wRZH2nw1YAR5+rohGxSSYUy
	a/aba6MszooTw9ZTn5C3yiZkGumADYw4Nxe/q/dF3y6SuMDs1dHUMzPMFu0LQXx4
	IDYk5w3yEIm8brIqy2KhPZMgh+AZJXudT7wvgva6l2xQhLhQJGOn/cEjralXG+Z6
	yD2S7y/JZUQbff3ejNR1fmOgzThREyJ/ROdZTnLuww+NoVTE+UWhpia1W6bfk4Bb
	AyawRnHefyFrW14DTIjzUBMrzooB0JZZKlD/dgU2gGL5/kuqW9YI2DIIGJEyONX0
	VozvmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjn0x390y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:11:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f31c6bbeso701813a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 21:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772169073; x=1772773873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjJTpWloqr/bJjbh8x8C9pw0cFKgkVI0nle3ydeuQNQ=;
        b=Xy/34eVemByUIArGIkKXsOzyFjXQw4kRXHgMJuVoKroGxnQkK0kgRM8MRSrP3qnZqb
         CNx0ueS6cm0nRN0Rlj4NHSFaOyu7PBlTVGDMgcjSBK7b1uRXb7TiLfQq58fVvxylpcK7
         /crr9hFYo1dY70bAiURO3VMLLXAC4rUtn5CgYT8ZGYS5pmkko6n6FsyfotSC1NgcApGC
         1w3ZkKn7twyAIRttyHLIigg87qNkiZJkWaRkqUM6XKojqNwoVnbNaXGTWnArVuqVxxq+
         7TizWHTPB8vHdq59tz+607JDgB+1P2OLSAi76Dv/UW/nj+CYRVruc3N1vLBGTcxoyp0H
         x0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772169073; x=1772773873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjJTpWloqr/bJjbh8x8C9pw0cFKgkVI0nle3ydeuQNQ=;
        b=UF2SETb9Cq6VcxZHRUAnREUdOg7kccz2KJMw5kuH0Gxr5WnMI42W3AnmZgB69l9i7h
         HKqAr68cOyTaCP8P4N3AqAv7tT8yowgzbtzOtuyEtL+Nsp+m44YbMTFxwRtFTJz1viqN
         1MqtjiF1+Nl2NwuQph3Ftq8WOZAL7/5n2E4etkKCioSNz0a7qA1uJPxcNYVypC8m7ODZ
         njZHK+K1eBXK+u+leBWBi3rp/FmcO/fDqOoqz/mOJfD20eaYyg8MggrMw+WxgojZKLOQ
         ycWpzrf+Id3dTwzuzocXwR2OpX9yB2UfG86JGtZK+LQju8R6gmpMHhJyGK9BTrbP8zSD
         +ebw==
X-Forwarded-Encrypted: i=1; AJvYcCUIBE5/oEqhMpsP3N457cUfR0UI+8lF2onDz+6ehK6vsmhvlrD4p8W4jG2P7C5cUSAJ1GGs2azNIEUlwICz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//3KHJovvxNwGTpy1axWlwMUal+tuJO5IPHfnTHJQcXBuZAdS
	UlP5lsXGZuU08O+RMbFDK07GGhco4vhHFJzxGZki1/aytJjpsEhWDb8l7bi6c/uN/bO5sx3yExD
	Ai/P81McIoEOgmNlrx181H9xK4KyfmLruZ30Ky7HaNU9ftMAFU/z/wIHS7M7GFmXUm+Rg
X-Gm-Gg: ATEYQzxllbiYBgDbmiO8fTqYOYRRlMRZjTe+t/YYD07eSn+p0p2purbt8zupUpqyyDa
	I1aeOWDneLhlCZGs+RQJWvX+8XMJw1+sntZ0VBmfjdFWxr6iHZXekv+xuD5yhhplIY8NMpfki17
	qfb0vAXvAfRtGkW4pQfTQ5Z4XzkACw4LcLAuHqN/ujKGOZtF8qCZ29nHOJBYb2ayX4pgWEGAX0+
	4BGeuyTMaIREm7FmJ0YE665QiUu9GB/67SDM5s9oDrrfV9kc/HCxQekZFa2H36xLSAaTVlUSWBt
	9HDRK9eUcxvoLZEXOsl/FXW59LdsIuK9H9v/EUf0Cc93XUWZo9Sx0IQ78F98u/moh6Plz1mew4R
	cFk4PodcisFS31jstb6PWeVQZQEypRPIu2S9nXb6RsQ95D20HJC6NBVrDRUgt5Blhz9g6+Zqh4D
	zDjwwle3yPsSUh/Xk=
X-Received: by 2002:a05:6a20:729c:b0:366:21f0:cbd0 with SMTP id adf61e73a8af0-395c3af1ae9mr1209500637.3.1772169073292;
        Thu, 26 Feb 2026 21:11:13 -0800 (PST)
X-Received: by 2002:a05:6a20:729c:b0:366:21f0:cbd0 with SMTP id adf61e73a8af0-395c3af1ae9mr1209491637.3.1772169072873;
        Thu, 26 Feb 2026 21:11:12 -0800 (PST)
Received: from [10.133.33.97] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82dd09sm3542913a12.28.2026.02.26.21.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 21:11:12 -0800 (PST)
Message-ID: <45f8be25-2ca1-4ad3-a549-23b1ce057413@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:11:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
 and DP mode support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        li.liu@oss.qualcomm.com
References: <aYXvBGVdwXTrJNio@stanley.mountain>
 <e110546e-dd18-4ebe-9281-adfbdde98d7a@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <e110546e-dd18-4ebe-9281-adfbdde98d7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tKgz1UDHHKbHrZzQPpiVqUYJBOzw5JgC
X-Authority-Analysis: v=2.4 cv=I9Johdgg c=1 sm=1 tr=0 ts=69a12772 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=JassTcn4au4-2yrw79MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAzOCBTYWx0ZWRfX5Pn/OI4kI7pC
 A9RD6blRrcu9fl2EkE0kFEeKTbJEIF65Dr7+P//6bc/VPViDtiH0CEOSBJF73BqJrl1rWbQ5CiG
 PzCsXRrUvwB1TWwN64bY4knXOW2uE6WyqLveFhwfWGM/Z2sChdNFQW7p9NQRbKwn8BpZYNR4puV
 IvfEzJDjxdvG/0sck2P+vBcA37VT6nPQ/S8Z+lpGX0jwYq2VU0hChduuDzcvNiyHFY6mr3ewFzU
 k/2m12ngzdxm4GmB/UFmcD+qXPGPKwnZ4LPwTr9RAHaHZWceghZ8sE3Fg4vlkJ+itosI4XAYZcP
 D96vdbL5XNb+hYuIu7cv58DA23OM9pL+VSm8kwOqUcPXS98C4rm9bYjiPABU4cHOgOXOTr0/0F5
 BZPMY4LtcyHFmJxbsYRUSdQzFw5y5TOFUqsVra88SvZZKFiWxpZWCpWC5XWR14Z64XV/hYKm03p
 XD/Cpmz3E/kelk5qiQw==
X-Proofpoint-ORIG-GUID: tKgz1UDHHKbHrZzQPpiVqUYJBOzw5JgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94378-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[xiangxu.yin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A74B1B2D0B
X-Rspamd-Action: no action


On 2/17/2026 11:27 PM, Konrad Dybcio wrote:
> On 2/6/26 2:39 PM, Dan Carpenter wrote:
>> [ Smatch checking is paused while we raise funding.  #SadFace
>>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
>>
>> Hello Xiangxu Yin,
>>
>> Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
>> config and DP mode support") from Dec 15, 2025 (linux-next), leads to
>> the following Smatch static checker warning:
>>
>> 	drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:803 qmp_v2_configure_dp_swing()
>> 	index hardmax out of bounds '(*cfg->swing_tbl)[v_level]' size=4 max='4' rl='0-4'
>>
>> drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>     777 static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
>>     778 {
>>     779         const struct qmp_phy_cfg *cfg = qmp->cfg;
>>     780         const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>>     781         void __iomem *tx = qmp->dp_tx;
>>     782         void __iomem *tx2 = qmp->dp_tx2;
>>     783         unsigned int v_level = 0, p_level = 0;
>>     784         u8 voltage_swing_cfg, pre_emphasis_cfg;
>>     785         int i;
>>     786 
>>     787         if (dp_opts->lanes > 4) {
>>     788                 dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
>>     789                 return -EINVAL;
>>     790         }
>>     791 
>>     792         for (i = 0; i < dp_opts->lanes; i++) {
>>     793                 v_level = max(v_level, dp_opts->voltage[i]);
>>     794                 p_level = max(p_level, dp_opts->pre[i]);
>>     795         }
>>     796 
>>     797         if (v_level > 4 || p_level > 4) {
>>
>> These should be >= 4 instead of >.
>>
>>     798                 dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
>>     799                         v_level, p_level);
>>     800                 return -EINVAL;
>>     801         }
>>     802 
>> --> 803         voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
>>                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This is a 4x4 array.
> Thanks Dan for the report
>
> Xiangxu, are you planning to send a patch to address that?
>
> Konrad


Thanks for the notice, Dan & Konrad.

I just got back from a long leave and will submit the relevant patches as soon as possible.




