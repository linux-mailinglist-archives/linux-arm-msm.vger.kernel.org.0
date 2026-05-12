Return-Path: <linux-arm-msm+bounces-107121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C5eGo07A2oL2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:39:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBF522B72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69E5230FC169
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63A73B5DEA;
	Tue, 12 May 2026 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWOZ8aEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnOVux9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E94D3B5DE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596414; cv=none; b=fyL5VN11glVuMH+Hv9nFWZQr8Jm8yq9WbAGf2i9umcfsLvSakIXXdz6WEkFCbsqY9jVa//kdO192oT+SLIp3DGoIfj51HPwhHXwoBGHqOkHbRsoRQ7QpBGVftE0DYS5Ju+0ITURtl2quTWpnSipT9EVkS1BJgUrg5f/3gYBOBYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596414; c=relaxed/simple;
	bh=66E2R+IfJ1HoNzP0tot6+oyALpG4CzusyO30QbGdznU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HL9f40SZhA9FBjBm+NPLnwQYLmn2HTw3TRJ0ansPeunVz1KCuur2AOgG/WQDr0wNocTWID9rl3Ez+K2zPxjJNYO8EGhL775pYSO/IrX1Q5q/mNL/jW5SCu33fJ1ztGTb6w+VD7kZsUJqQBOllfMqTTNdmbSMdbtI3RQ/rfGgWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWOZ8aEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnOVux9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCKvfU545069
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 14:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UqT1tdnjdLxJ+7v2qQe7AJIJhtIzLjmsJXo+lXS5p0=; b=bWOZ8aEzgffOooif
	JFJ4xONs0lsszQHaBW77//p28Iyd+4y0Q9gTTA2vW1ZPT7E2jBKX9lO4h/b2Ww4r
	QEt952+rBmdfBvBQdtQwILb0pgMjD+862XHonnD4WJyamys7qIvIxGhOIlqDieZk
	QOVCSNwZfL6HxGsK95NVi8X5rA2xWFJ7/IU5iobuc8qRj8EnuoLxCjPGGhQCxLHH
	wxKXaFiNYRilMEvkuP6m3ITORSPrEd1hdSJzB0dFrDI38zGilIlW+fXZQAvW4fOt
	9CoYDEgA7mjaNxCu5PSdePjae0CkVpLsYmSpFHH3dsEoW5fuGERiCz2yFd3NVyVp
	fX3BGA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444srg31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 14:33:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828659ecd4so1442986a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596412; x=1779201212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UqT1tdnjdLxJ+7v2qQe7AJIJhtIzLjmsJXo+lXS5p0=;
        b=SnOVux9TsX4r0BHrxVpWjy0IyBhtutW69bu3an3f6yFA/2q6FaoP4q62DnFk5bg3YK
         pq3qm8dRU3/vHrbfz9epxGGW9niB14Q8o06h27zANr43fKSA2XMB5dJIvfqtq+ttqiEI
         jrg7T0tpgkaBAcfUlguP/W+kD8YwB2842Xx8uyiSeDXgYRHQvIUyS9DyFhuTpVlNlvQV
         eUaTjMFPG7DrXewv4x8JSM6c+mCR0FtkyOK3wa2VkfW1gyD3+xDhRyUbU/EGGvbl5m8z
         tkg1g9D07JjOTlwoTjWKv3l+Hbc1Cqx+kiPrxpasyjlfr8N6umNWzCogfWcNw9CWmjWv
         yt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596412; x=1779201212;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UqT1tdnjdLxJ+7v2qQe7AJIJhtIzLjmsJXo+lXS5p0=;
        b=WxfmmYt6327jSblqBRov4Dx9sgWvnMFMv9l0cNGfkH+WO485nfzRKY1xNnHWAtnMeQ
         nlw+3PLDXOWprPlsDN9oN1RpyOzEQDA3TkPjdY7f9kCu032AlVgisB3Cj5YD5CX0x59U
         XhyTHInCCZ/7wTzsMZFQQI3ybB6H26jh3kgjqtICtgio+W/ajm6ok7iZNVl9FtoKzHDp
         hAUbg458xzfQxr5K14oFcU1B/qR0MUoVW3CGPrdKbBtOaxQ84tqFt9Z1p1rf1nEuZ0En
         OApkLKnD3gLT926T6XbDnfAsHizO8uTD85I87eUvQI0g9HwfXKUGVANb9Bg1E+IyXUqI
         Iw4w==
X-Forwarded-Encrypted: i=1; AFNElJ8lkcs21GAi7gyNc47ehLaiNmv15r4JSfOyBq2jwmuj+/U27fmXfgkdhrbqfQhS0Gfwefq+Nhc0MrtTZy6J@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5J+0ZM4WhcufC+0z90Bfcuv4oZc3/i2KcDgGJKaAt3DG9cJ9
	Q28fjCXg3wF8ZiOWtu2kdsYouCoi8EYK1qQ9oVX55secPY0dO3f3oHZ9ofvM7V91eKxnAQNTYpe
	75MmhD3agnlJuKecI1EHA1BvcwbP4FhAbYAl7HiHjpunacKUVenGkDvMUabtRP8zH9W2dqt6eMT
	kn
X-Gm-Gg: Acq92OEqIBe9PfRiLqTCVn4gcdqb+s/f1LDT8bWQKzsWziwxfPnxMjgjLDBDsBe/H7g
	LoeAXoiVLxuW4J0HlFlTbzyfsEpMr6q7vSW3YW4RWo6iXw13tCwtM9F1VR4v9Pe2QP4kZK9HAWG
	tJpTmJlzHG7YAXBSOw/PHTTKOxqbIjvjMQs8XhmqkgmEE+pDRLr/+86BSfjLOO2/op8eqYV5Hyy
	6UUqOQcKYOqM6T4ymYnTDQvmdeJvuUdDKSj6ZCcYYH6K4BpkGia2ZV0Yo3VfbCzbwQoctYQvx18
	musqKUN6vy3WsGyLyhqXnRFyyoJy8nFQMYfJ5Y1QbVLfJF7ywaelrE7ECjOOYTf3x4KD7hW+bL3
	NWoIBOtzZuR8+HCRd8FLipik9c1o1aQiuVepR4XlmI6/8Lsiz6Q==
X-Received: by 2002:a05:6a20:7f9f:b0:3a3:aeb2:73c9 with SMTP id adf61e73a8af0-3aa5a8651f9mr31162730637.22.1778596412096;
        Tue, 12 May 2026 07:33:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9f:b0:3a3:aeb2:73c9 with SMTP id adf61e73a8af0-3aa5a8651f9mr31162699637.22.1778596411501;
        Tue, 12 May 2026 07:33:31 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.49.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm12312113a12.8.2026.05.12.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:33:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260512112458.1048999-1-dnlplm@gmail.com>
References: <20260512112458.1048999-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE910C04
 modem support
Message-Id: <177859640917.34096.1131987035700865289.b4-ty@b4>
Date: Tue, 12 May 2026 20:03:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: tTocVxH8yESP0ikArlAHZ3_wjTzT0yjx
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a033a3c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=NvllDC1TEbtqK149wpmGsA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VJJ6c6LgywicNbbkzIgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: tTocVxH8yESP0ikArlAHZ3_wjTzT0yjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MiBTYWx0ZWRfX7vo9VhiZHgkm
 LiPM8pEFwmHXtTD59RhpJSBi5W8WCfK9d9/KmR7e95Tg2LJ//RBF0IrVSDw1gVsQkrcIfSvZGdw
 LKVuXkqOY3Ak9A78NP9RS/lDVyhxfwe+ar/asQtQN1micvm8GMRZlNM02HHYuJz0+QuoC8I9S08
 dPPfWTKzvyJQGzP4PT4VWw67xCjx943FWBgio9Jmr+6Vd2ttTbpPV7Fo4r2EjcdguYzVAf+/OsK
 CCGa82JtM2A1Y2yUx47penX421wlMwP00IfW/68MuXYQxWRpatkS75wANylXQg5imDmzjJfjWLn
 upEegp+d+g8RKUbsUYt3U0I1shjTWeaIY6Ptf51n2xY6IpK5I1woqxyolibuLhq8OedkMLx/Ikd
 snmAHHcaSu0UNvJM7FLxzLEAetOi1P0qC0+Uihxlwbb3ZPIzxlYCViltcMtJ3QAE6UqxgtBcj2a
 kVgj0tE0BMKV86vuqnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120152
X-Rspamd-Queue-Id: D6CBF522B72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 12 May 2026 13:24:58 +0200, Daniele Palmas wrote:
> Add SDX35 based modem Telit FE910C04, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>         Subsystem: Device 1c5d:202a

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FE910C04 modem support
      commit: 5096977d0da4b4176410f12d79716568858ea3f9

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


