Return-Path: <linux-arm-msm+bounces-115337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iivgHnuLQ2rjawoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:25:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5746E21F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:25:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b0rUq6m7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RrpM42Px;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115337-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115337-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E2F1303B726
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8700B3612FE;
	Tue, 30 Jun 2026 09:18:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDC134F474
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:18:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811103; cv=none; b=NWBAdyuyLieZOO++5ZbD/lL8WoTEmJdxBqSn+50S0msB7v7gn916GXcuBxzRF2msvbr66FiggjoQHq8mb2BAngBHrbwuTKJEXAt86ckvcInu8ZR2nVe3JAYd97VFXi5fo61DaquO8Y2AqjV88NWQ5lz5nPERI17D64tekxDDi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811103; c=relaxed/simple;
	bh=coKWl9U4jQrOxE82TlyQmZMKy0BYmcR24iP4GqW3f8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxn3yKQBwtj7AGRlAyLU4de04zP5OAlHZpUXc94a4CHU4XmHb0RGmi8wVrynKl7472BuYa79QF4+4zOF4zVTQCdHDs15lNhY43hwBRPPh6zqUX/3C/KS38ZPfUh+qiE6krxESkbP0ZoRzsR/fBvRLbHlumS8sZlURaTv5d9QJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0rUq6m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrpM42Px; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Cbqc1098067
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AgS0xKWDmb8o/ux7R4eeyc7OOTqTfYTdbGCfGoEWUc=; b=b0rUq6m782QnUCNM
	rAQfQkJu5o56OMWibZjnZB1kvR7tCbrYsjMHwBsHv5QGxtNASCIsnhLmEK3xI6j+
	U48feRmn+ipxxzaPNitBe3LuCRHjiQGRkI7e0fkFjvPLFEdTwkXzsVyoydCbls8W
	L9pFVLsbwPXyPVy76Wf6CIsi+yjhmEss8l/3YhWYudEr9v+mlTyivN2dZcCVS368
	XyshNf3OtzLZElayp9XRF6/gGL+guioRemekyORTNmypopxxVd5NjIuC365vhCp4
	8k4V+9SLDeFg913wm/f292E86nx41ntolud9is7GtCKQSXO7URvkOJYY61qtWwuu
	5Z/xiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cu0hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:18:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso11760785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782811100; x=1783415900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AgS0xKWDmb8o/ux7R4eeyc7OOTqTfYTdbGCfGoEWUc=;
        b=RrpM42PxQlWp5fMtFfdHORkahVbx89f0lDv3kK2/7/T9saU4MW/M0zY8lDd5lWpATu
         Z8cykXXhj19oj7zBx8ImpC6JlF9h8x4JBXqbziata8DQTvkMupG5f7R+7xGUEtRMOCCi
         Ta0nr5OktY9FPxkrSWZIirmh2RvFUzs4hsPsZwC+JyBn3Jk9Ntg9LT2Rkb0nZlKJ8C64
         4zY75XpOwu1HQGj5uOgJIBSQ6EsOdUbeBczLy6EHF678IjuSaPyyZ/LGl15V+PlrzH4U
         L2ZrxDmxMfXh59WzuJwAx7TSvFQvW8kHJMJZ13yJe5XIaz6Vant2xSd0xfgG1HQjRbTX
         SAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811100; x=1783415900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AgS0xKWDmb8o/ux7R4eeyc7OOTqTfYTdbGCfGoEWUc=;
        b=dyTYdkaF+EF1hcaTYy8A23DZkuzrF+7KGDNCbE4x1NOM7/Zbd/p+i15YRIumjq68Yd
         gyuVwqjCRiMmWf0qOiNXOgJdpTw3qjoKBR6+lRZ+UFmvV4CSQsjrcxXbH/G5JvVCENvh
         loWFjUwVRl5Kjk+B7xVCqNAsrBwwLmU/U9C2Qk03B8ZqsuQ3SeLDgpuoG7EDKO9wB8y9
         6g7PfFd5WP8BLQNxhzyaLdyBx4vaX+QbmwKV2i1Z+5u99qAqiv8Ot05fUWUU1y8o/EDM
         iS8vlmW2M3A1W2e4i5H1DGtg0GG1DbSjMfm2o8/y5WlmU039N38Ji9FPG6nL3cg8rVZy
         LrcA==
X-Gm-Message-State: AOJu0Ywpjyg9Id6jYP4pNpweQazu3aAPCa6qsPO4n6kbxLL45l6cQ8P/
	fUKkkEDiRsCa6arOBFW/u2+p7z2m+RuD+BwkkEa0BD1mHErDzAsi+ZK4OJXvn6iW1fXOpp7rQM0
	U29X8uZPJZk0NVsGaW8FzmLSkkKaZDHJwJurpaxJLNCm8qjFzTMdZV0og5FSa65tNfj68
X-Gm-Gg: AfdE7cno1bY9WIdtVCKU6G9FEvYlyj6Qo3xVJLSkrYPV9bsQwDv2WXRCmwsqnkJsoDy
	JfowowgERhEY1kSScxzqQ51ZSfXLk9Wb/5yp2zbPJfrvhc5Z3PBBOLY/QudvH8GuFFkZb8uWuhg
	rIjkfyS5vTwUf+fyKeEl7q6xnVuebcBaK0IQuG3If80nOspyjjMcCD8aR6FzQO/6b2vGqYVYy+2
	T4o+5ZdWSTuq2b++EZl8TG9Js9oksV7TBCy3lRmEb/RT5T+bnxAOmAfpZd8Li5/4h6N86nFE6Ex
	aUO0+XY5RW6GEzOPckqnC/+pgOKenxIy7+KkJHlU5oHgQEhgFmZ3irgyKv91YTkPkWGP6xDq8Lg
	fDBCh9nF3nRUcC4qfZPg4xWqG90LyRvMltTo=
X-Received: by 2002:a05:620a:390e:b0:92b:55e5:864d with SMTP id af79cd13be357-92e627b0227mr288265785a.3.1782811100646;
        Tue, 30 Jun 2026 02:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:390e:b0:92b:55e5:864d with SMTP id af79cd13be357-92e627b0227mr288262985a.3.1782811100219;
        Tue, 30 Jun 2026 02:18:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289176eb0sm90864266b.63.2026.06.30.02.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:18:19 -0700 (PDT)
Message-ID: <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:18:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX4WJkbF28C2Hp
 or8bDQv8yC2Qn2TERbkWS4765L0kbuki+2wKJdyuswJIV+LuEXJBMSLYKMYnLNV14sr0z0DGxz9
 irN0d60/hBPqYGgi/epvFmLxl73yN8v6gYEoIPsVXERk3vRdbkUEwzdIOvzloAmqRl4GhphbIUS
 Ix/U6WCZQ43sSzLSDgxB/6XJzLesT1ZoBx4gNYv/B+opM9eKYEbCvzSWDi4wKoP7HBjxef/EV/q
 L2eFX16WCgHTY7qDy+YUCPUibz4e+sOMQC/FFW6EtU7rhMvNF0SmU/cuiFsrHVPStSoLHhRVr7/
 bq9IqLiAH7pEyLM/3FtFh6LztPbY/hnoHAy48A3wBIYUJn0skQUwC7o6QEVuq3b7e3XTfNvWRFt
 b9E0ayKT7Tu/MR5i4ZI+o9K78Q8gx7k/rxa4IKg4TTUJSIx0SPLNtpcntyjCJj3bifiKZCO8OYn
 8/2sQSatB0KznFcr8YQ==
X-Proofpoint-ORIG-GUID: 0yh-f-WoXLXP1m8XooMh236xZAvQP55l
X-Proofpoint-GUID: 0yh-f-WoXLXP1m8XooMh236xZAvQP55l
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a4389dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=JXoQ1qKCfQLX0Yv1_mwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX7Wmwrlz6GAqq
 SiWvZ7pXX76zwhvX+Xllf0yl4lfA7FnUpClZgUOSyz5vY5CkUYRLydgbNahvRFKK5Wu11cImmcQ
 eJdYXNug7w8orhsqg+Z5buNWg0H4EvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115337-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F5746E21F1

On 6/30/26 6:22 AM, Pengyu Luo wrote:
> DSI panel driver have been added for a while, so add the DT node to
> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> describes the wrong, no impact after manual disabling these wrong
> supplies.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

[...]

> +&mdss0_dsi0 {
> +	/* real vdda is unknown */
> +

L3B: DSI core 1.2 V (both?)
L6B: DSI0/1 PLL and core 0.9 V

Konrad

