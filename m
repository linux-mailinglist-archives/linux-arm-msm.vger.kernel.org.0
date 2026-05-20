Return-Path: <linux-arm-msm+bounces-108825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEiWOLviDWpF4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:35:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE15921AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFF3C32EA206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1ED3EFFB8;
	Wed, 20 May 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3lKGGOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LisuZ38h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CF53EFD29
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291590; cv=none; b=PNUsVkoFlkkMhGgffu/3Esdv1AxtMifsRYNk1LFXWwvpgv0CaGpZ33sTQ23Ee9F+PPGVAFzsLvGUI6nsW/89M29blk9vKB3iDrRn4bHxyiCMYM9RliseAUZpz+NyBl8hl1sSmhSo6p2vbNkwtbsE9U+KjM96juBZgZgiueySJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291590; c=relaxed/simple;
	bh=Nr2JR0dpmuWjfz/WKWJ82bULQ71y+4zZb6kDz6jYenM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=ujg91JnNEpLiZU9ntBLl0Km5ETIwNLfgXN5gACCyASAxeaeCNgpOD1C9itpMhuSJqqhqFrKH+TCUA0scyHuOmFssUQaQ9W0hveRlEEG85oNOsj4/9Fd6NkoLaTkYVyiAGCP+CpE4eIvig/MJoyI5PjuiHHH7f3K0H69ePt5Z6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3lKGGOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LisuZ38h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuVc73680313
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KDEsJl+ouBVmHeKEwleH/vX4
	IKf0Y5kx3a9fe6U5jtw=; b=A3lKGGOyHVCC26b/kKVZSeKENVLeJuhALwex6RqG
	Of4u57otpR+2/FQuIvvyMZnuRB6s7phqVB+Jhp29axK3V107G+owsh1Qq0Kmc3eD
	b9w7gT1kgl0ub9b+CpGpq/DNCtjjTVYiKdn/xTsuPpmQ1CCewTmwFlg/3KRqzRGw
	c2yCZzKlaQSgtiQ++mE0qYMb5BxARRK7xAG2lBMdBckYjkeJ5gqgmqjuQaIEWR/u
	9RF2CUmJ2DMJ4Vm/I5LdLRakXAygBE7yhM5eRrW49jpGoVXwolkKE4W14b3b0dGN
	iD1rzeQLM8eVJEIE5bBkEyBRlAM5/3SjdR3OfHTl3KxHbg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j0f7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:39:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313c9d983fso3006887137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291587; x=1779896387; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDEsJl+ouBVmHeKEwleH/vX4IKf0Y5kx3a9fe6U5jtw=;
        b=LisuZ38hB33w6fTjcJuroNKtkOpEhJXCL1fPez2xhm7rn+dBb/nSWyvHI+wsap4dWR
         YF7tpQB6y6xTz3YulCAwv8LavM00YDtNao9eLNmg69mmSJfY2aH1HBru7XvCNLYlrSbx
         L/SEHV+LBhpLDnw5z/I4vFldnqX0/6lGfArxcg7DPO7kqoZsiKqeY1CdNlkAqBlCyJot
         dnRewB64CMCJMpbRPHaSfIMC6SrSuQtO7AKW6DP9NtmEb9fV8Xf2FytbYR+Ug9ro3IEA
         ubtPxTiYVJ6XWV245L7Y7IDYZTBTeDfLC/bgUKRi7fjfQTA9A6JoMbP/+QY2XHBVghdt
         5UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291587; x=1779896387;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDEsJl+ouBVmHeKEwleH/vX4IKf0Y5kx3a9fe6U5jtw=;
        b=chvO8TuDAK2B/dur38WuCgQztXCidIcui0V4IIJ+6CF+pQhypnJxgtQ1dq0RTwDHsJ
         3CFT6vAZU0bWwyeK9KJTZoeIHMcTA8suCBSS8kPioYtHXTHizlL9Cn2noSAIo6U0ib9s
         9uG5gWIS4/ubyiguPK7bjGLQky1nDy/reGVIkCS5E4aGQukIV9jUUA7n4L5avm8hl09m
         hoOkz3R1iqDQPVaS6YP4fVdGJ4sugB1g2iQTrr58hlz2tQpeaBCk7V907iqaSKrwafMF
         Xm6zmVGWEnsasgI96BY2IBB3WGz8ZcGuUtGFZykktQ/EVO/bwB1Fum2hPAmx41MhQRgN
         vU+A==
X-Forwarded-Encrypted: i=1; AFNElJ/YUf3U+c8BFbsro+hZt/2dcS018PfzMI5nhiRPT9AIlp/CW8+igsAb4jH9NsyFagyjnXQitR0m3KyKkCQP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81+hpf0ehYCMIGsc73aa4McEfUDqhtNI+4L0DykK1+xnuhgyE
	n912pWR+AWHh5Dww9I1Z8SebP/Nmb+dG1yC8eyKbzMdlYBncGMswhvwL93EtKzObqrhIvQhMUrc
	i7K3qz9rTNlKlAMU2aOgmP+YUT57m3hDvT0rOZxOY3HApk6Q34a8pAEHYRXYzpdlwjnT2
X-Gm-Gg: Acq92OHCtsNvai3wDL/45GZmFZRSyFmBELx0rA97jg8qlb48kIGe8qba6OgrTx64zv4
	ZAjyOrhd9P1c3DJJ15v5Jx627PvcUfqy9cMu87acUdbMioQ9HmO4QpfVDOtnN0WZm/oJm9R6Wcg
	7C8cEfhipvaXOJhY2TkSuQjK9145kp19YEMx6xDGJk+PnvE/9yrvF4RP1hw81jh53qrlHPRMSi9
	vxqVdKs3/HOgZeMyenFxsXAi/kzycsJ/MVQmFAg4HY/SzsWzsl2mrZ1xpwDiVh+yIHcK0lPS7D8
	GvgSPC7RDAf+54ZCnX+s1mJLxqgDe595+jhcBCu0TMYT4yXKuSznJXteLCQDUPj9IW6pEOrbcme
	Ekl1CGSfJQW6GZvC7oPz1yxn6kK2u3MdvmYmaWNgRpL4AEtLL+SselkeQ9l6y/euornCHDpDvy+
	8m1IByb2berqJSC2PwZRoNh+IdUOIIJggQE8+r73aog5fPxLHWUoxb+DW6bS8yUDTedVzoOEjH1
	SV8LylGgD40ZtTt
X-Received: by 2002:a05:6102:3752:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-63a3fea4735mr11679101137.23.1779291587053;
        Wed, 20 May 2026 08:39:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3752:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-63a3fea4735mr11679054137.23.1779291586517;
        Wed, 20 May 2026 08:39:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c2a68dsm887643266b.18.2026.05.20.08.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:39:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------3AmKf01MW2hv0Vhzmru0T8mx"
Message-ID: <038fc58a-7233-49b4-822b-a6d99abf2382@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:39:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-13-bb1055274603@oss.qualcomm.com>
 <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dd5c4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H1Te7B14W6HF1q1WNAgA:9 a=QEXdDO2ut3YA:10
 a=wa7H0P_oPzXo1QdaWhUA:9 a=B2y7HmGcmWMA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 3xWljs9eCKi8a6b5dvVcaZmLf8TR76h9
X-Proofpoint-ORIG-GUID: 3xWljs9eCKi8a6b5dvVcaZmLf8TR76h9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MSBTYWx0ZWRfX28tRs8YnFOn/
 XsiYmgYm9Y0bbzzqa3+auzuGtiJHNkwul6Rb3jL5gRwj92PvTl0Y9Z/0y/4mLnfO8XHv5JUlZce
 sqTSHKftt1WbxCdQ2LAct1KHE/vm/meG+PB0JuFRk4ReC4IkYz1lR730WArG0f+fHh8AuIUz2Hf
 PXEA9cKKmcQuaITPtZRMHAz7OYAfLR+BqvXc4xEhU9r19tHXt5LgYX5/y1VqsH+3pHw3oTB5hfP
 ZFzof9R5Zoc6ZG9woCQD3kyteLFOnJxmnXRoX8oOOiW09/MNr8oxpp3elGttOSdyIlYkf4cXJRJ
 tgYrPjo/KXiz/6qT+o8NmTt0moFKmD2a0wgMW/xTz9DoniJatNavorF6xeOtlhYkCqGPbMfatvH
 9NeRnqOMcjPMy01ew/1zC/dT3jfdDAFCohzgZMLj2jHsK14x+QxIDLW+3RzCp5DQLS3WldybLvG
 RlSRgVjg+ubdrTxbPuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200151
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108825-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48DE15921AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------3AmKf01MW2hv0Vhzmru0T8mx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 20-May-26 17:32, johannes.goede@oss.qualcomm.com wrote:

> 4. The v3 driver limits supported capture formats for the ope_disp_output
>    node (ope_enum_fmt_vid_cap()) to those matching ctx->proc_mbus_code, but
>    this not how this supposed to work. For media-controller centric
>    drivers, userspace is supposed to be able to enumerate all supported output
>    formats, as well as output formats for a specific mbus-code.
> 
>    This is controlled by the v4l2_fmtdesc.mbus_code field, if this is 0
>    then all formats should be returned and if it is set then only formats
>    which can be outputted for that mbus-code should be returned.
>
>    No active driver state like ctx->proc_mbus_code should be queried,
>    setting a compatible mbus code on the sink pad which is the source
>    for the /dev/video# capture node is userspace's responsibility.
> 
>    Also see:
>    https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-enum-fmt.html 
>    "Regardless of the value of the mbus_code field, the enumerated image
>     formats shall not depend on the active configuration of the video
>     device or device pipeline."

FYI attached is a patch fixing this, feel free to squash into the next version.

Regards,

Hans

--------------3AmKf01MW2hv0Vhzmru0T8mx
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-qcom-camss-OPE-Fix-ope_enum_fmt_vid_cap.patch"
Content-Disposition: attachment;
 filename="0001-media-qcom-camss-OPE-Fix-ope_enum_fmt_vid_cap.patch"
Content-Transfer-Encoding: base64

RnJvbSBhMTMzOTI3YzI4ZWQyNGRiZDVmZWMwYjQ4ZGU4NzE4ZTY3YTBhZGEyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBUdWUsIDE5IE1heSAyMDI2IDIxOjQ5OjA3ICswMjAw
ClN1YmplY3Q6IFtQQVRDSCAxLzJdIG1lZGlhOiBxY29tOiBjYW1zczogT1BFOiBGaXggb3Bl
X2VudW1fZm10X3ZpZF9jYXAoKQoKVGhlIHYzIGRyaXZlciBsaW1pdHMgc3VwcG9ydGVkIGNh
cHR1cmUgZm9ybWF0cyBmb3IgdGhlIG9wZV9kaXNwX291dHB1dApub2RlIChvcGVfZW51bV9m
bXRfdmlkX2NhcCgpKSB0byB0aG9zZSBtYXRjaGluZyBjdHgtPnByb2NfbWJ1c19jb2RlLCBi
dXQKdGhpcyBub3QgaG93IHRoaXMgc3VwcG9zZWQgdG8gd29yay4gRm9yIG1lZGlhLWNvbnRy
b2xsZXIgY2VudHJpYwpkcml2ZXJzLCB1c2Vyc3BhY2UgaXMgc3VwcG9zZWQgdG8gYmUgYWJs
ZSB0byBlbnVtZXJhdGUgYWxsIHN1cHBvcnRlZCBvdXRwdXQKZm9ybWF0cywgYXMgd2VsbCBh
cyBvdXRwdXQgZm9ybWF0cyBmb3IgYSBzcGVjaWZpYyBtYnVzLWNvZGUuCgpUaGlzIGlzIGNv
bnRyb2xsZWQgYnkgdGhlIHY0bDJfZm10ZGVzYy5tYnVzX2NvZGUgZmllbGQsIGlmIHRoaXMg
aXMgMAp0aGVuIGFsbCBmb3JtYXRzIHNob3VsZCBiZSByZXR1cm5lZCBhbmQgaWYgaXQgaXMg
c2V0IHRoZW4gb25seSBmb3JtYXRzCndoaWNoIGNhbiBiZSBvdXRwdXR0ZWQgZm9yIHRoYXQg
bWJ1cy1jb2RlIHNob3VsZCBiZSByZXR1cm5lZC4KCk5vIGFjdGl2ZSBkcml2ZXIgc3RhdGUg
bGlrZSBjdHgtPnByb2NfbWJ1c19jb2RlIHNob3VsZCBiZSBxdWVyaWVkLApzZXR0aW5nIGEg
Y29tcGF0aWJsZSBtYnVzIGNvZGUgb24gdGhlIHNpbmsgcGFkIHdoaWNoIGlzIHRoZSBzb3Vy
Y2UKZm9yIHRoZSAvZGV2L3ZpZGVvIyBjYXB0dXJlIG5vZGUgaXMgdXNlcnNwYWNlJ3MgcmVz
cG9uc2liaWxpdHkuCgpBbHNvIHNlZToKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3QvdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9jLWVudW0tZm10Lmh0bWwK
IlJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlIG9mIHRoZSBtYnVzX2NvZGUgZmllbGQsIHRoZSBl
bnVtZXJhdGVkIGltYWdlCiBmb3JtYXRzIHNoYWxsIG5vdCBkZXBlbmQgb24gdGhlIGFjdGl2
ZSBjb25maWd1cmF0aW9uIG9mIHRoZSB2aWRlbwogZGV2aWNlIG9yIGRldmljZSBwaXBlbGlu
ZS4iCgpOb3RlIGFzIGZvciB0aGUgc291cmNlLXBhZCBmZWVkaW5nIGludG8gdGhlIHNpbmst
cGFkIGxpbmluZyB1cCBmbXQgLwptYnVzLWNvZGUgd2lzZSwgdGhpcyBpcyBhbHNvIHVzZXJz
cGFjZSdzIHJlc3BvbnNpYmlsaXR5IGFuZCBzaG91bGQgYmUKY2hlY2tlZCBieSBjYWxsaW5n
IG1lZGlhX3BpcGVsaW5lX3N0YXJ0KCkgYXQgc3RyZWFtLW9uIHRpbWUuCgpTaWduZWQtb2Zm
LWJ5OiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBvc3MucXVhbGNvbW0uY29tPgot
LS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy1pc3Atb3BlLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3Mt
aXNwLW9wZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWlz
cC1vcGUuYwppbmRleCAxZmViZTNlNzQxN2YuLjQ5NWQ0YjBiMTAxZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWlzcC1vcGUuYworKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtaXNwLW9wZS5jCkBA
IC0xODAwLDcgKzE4MDAsNyBAQCBzdGF0aWMgaW50IG9wZV9lbnVtX2ZtdF92aWRfY2FwKHN0
cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCBzdHJ1Y3QgdjRsMl9mbXRkZQogCXVuc2ln
bmVkIGludCBpLCBuID0gMDsKIAogCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG9wZV9v
dXRwdXRfZm10cyk7IGkrKykgewotCQlpZiAob3BlX291dHB1dF9mbXRzW2ldLm1idXNfY29k
ZSAhPSBjdHgtPnByb2NfbWJ1c19jb2RlKQorCQlpZiAoZi0+bWJ1c19jb2RlICYmIG9wZV9v
dXRwdXRfZm10c1tpXS5tYnVzX2NvZGUgIT0gZi0+bWJ1c19jb2RlKQogCQkJY29udGludWU7
CiAJCWlmIChuKysgPT0gZi0+aW5kZXgpIHsKIAkJCWYtPnBpeGVsZm9ybWF0ID0gb3BlX291
dHB1dF9mbXRzW2ldLmZvdXJjYzsKLS0gCjIuNTQuMAoK

--------------3AmKf01MW2hv0Vhzmru0T8mx--

