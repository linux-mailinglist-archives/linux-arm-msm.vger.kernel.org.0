Return-Path: <linux-arm-msm+bounces-112921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FWv5MUjbK2oQGgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:11:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 201066789B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IgFMujEY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SFWXVFi0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112921-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112921-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB48A3040FB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC2427A107;
	Fri, 12 Jun 2026 10:07:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0133AD8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:07:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258862; cv=pass; b=MQZXgXaP/ngAZwpqjoA0B5GY1aUu0hlnVP2HU42XUuASbaYJyxyjOLC0TyVk9OwslaRUnhAhGEbJQGlgJv6o79EkS0oWv3OkNq1aObv4ozd7YSLw4K99aJUPl+9yS3nj1Lg+qs1EoPLdLb7aVxBx7eQjhWvgmPGKG9vA1aOIGgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258862; c=relaxed/simple;
	bh=cHw3EhfIxeFggCpzm6CPqEcKG4hAZv5HGwcoAKqnwaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPDzM6osGUnY1Hcu+uYtzdvuuhAUnAdUZO79S5SazJG7TIznoFDSwYGhtBHYcGxUATJxHIsVELb6C8gTAGMXjb/hQlPr33pU07FDB2DrzgBABC5Z3De+t+JUcez4xPgQHayIawNPyULKliosMX8eiwV6SIZuhDno1lOLLFGkzWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgFMujEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFWXVFi0; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BZne2548171
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=; b=IgFMujEYL7nMZWpd
	KLt4YyRgH50+k1NpU1LggBs55SiDEHrC2/PN+/ZHCO7nPlyoEzT+W2Q6BK8LBbmR
	yCFP6p6SX0zKBq5OLLfmZp1tpnnRXVuRO1slxq2z4FMsarT+TYAMGo2sUFtuDXpA
	drZVZb4R+8gJtgY6prfUwMyHi47ZNvlK15W3OkA7E9sECp+s0r8FBguCM6giwm7b
	cc3j4TnyGUf3YiDyV6hYMrMW5MolB0YP+vKbEQ05H/yq7f3IzUnkHzadp4N788ug
	Z32fgVOfw+kG9QHI1EZIkUCeJWo5e77pNo7NA0LP7ntclwZLFH32bN4HLE8YiNn+
	b5HnOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29utkxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:07:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517afbeda8eso20470491cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781258859; cv=none;
        d=google.com; s=arc-20240605;
        b=d/VtCAgyfmd0OM8hLYYcnz4PMWzJnbeuh41xbSMa+rfLn18slMwAuDvGYoY1ZDEpF8
         h28bzuTMxiWECplRf2fCFcQFfVylFqTh97NG936Y7M/osAU7GXijpMmIRlQvdNpLBG6C
         tV4220tT4D98HueIBYkcSa+XgStFWe8lM24BlZ4MUtcSC3DWgSyvPWCJs82MUBptSXil
         7XGjzBqwA6Kkk+6hlMeuVnPsdUymiNTQyEPMLtgGnW6WcXBjKLV/WBa8q7qR7ei2znP4
         W7JJcVn6AE2SQqk7O1p/77gJmfuqOA+aIFGRxASE736RKFrk90E848QEynIhFTo+9IZe
         /2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        fh=4Qb5r1IGA5831aS5JtjfvpArKguLTEUCkqQMzYj4fpc=;
        b=bcHlwmzCIA5X6/9Xnc9OtV9vDPdNaTb0NQlhSUvxUMqX+PmqJvWHR2FGp5Uefi/zk/
         Tl4CdZ0sklyLOCBx3uxI6skQqFbWFa6IlV6+HiuWA/6+QA6ystos/XjhBrbMvr94uMAE
         SQVYBWVJ0+AZBPYcRFBSGVlB8eLgE9TaTFnErCPZsYFpmOyzzpUCRiZ6U7KMGfTnvO8v
         SbVdSrQ3+lemP1sVT3vOKFe+Mo670aFu5+hiBgHhVvZSR9ra824Laa1e4sylwpIJvt3P
         d8wBJAl7FevnYzv45eEjWgETwzoS16jtapFyu4wof2KvBA5c1ZjY36mqeaP0h/59p2lm
         MMqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781258859; x=1781863659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        b=SFWXVFi0ZnxVleCg0JBYZRdgDPsK8xXeeipaNzgDkFxRxsmOf732RE4JTAp6Cdnjme
         TJfgHF0DXqdvvaXFaRRMeJ4EorYbWoPn+0IK1d69ZA3ThqrUyMpzI4aKJbMyid3jRnwv
         g2S3FL8IjgadOb14qByfyzSF/knV/QJgRjcuIZt3v6hN5CJT65IabEZ99+N6FuwfCvUZ
         zo5HBkXxeZ1glMuVT0xF4V7u4ID76PpFVx5qaXFrg+1Lksb+7T4jQjz5o4SghFupin7+
         wj3o9Ez8OvI+Y1q73Dfojl6+vbkaPJYiI0eCXEPvZ8FUjK0dKdgl4dJ0CkxnEZOId189
         lv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781258859; x=1781863659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        b=R54Am0SDDAxMCbj51Y2v9WlS9/2ejobTXyHTFoDYPlZUZb3hxgJ5KfjJMu6gNsPpdq
         JezLILRS7JaKrWgsqhhs+Ku/sy9Zp7rjOLxSENKkWNcm1OFCVBKstdiuDKCHha0Rc5yJ
         imYpPNdD8ySil6VDB8e1YtxvsTEmytwQmhDH/LfZ2JGuYbJMVILFjaAhkmLt/RGV38Xe
         N109zRkyIcd1lvvTsjqVslEP89hNxiP22BUa5HkiSZtXr6fEuPfisWAWxkN+OgUrcqZ2
         QPdvaQrUj8osO9BGJOsxnyn6DZUs+heK/SofWHgmwFXQ8qGzpfWcxioOt2zkEIhhymTS
         Te8g==
X-Forwarded-Encrypted: i=1; AFNElJ8U1TS/6I4f1WyCl8A0M2IJb1HRCNdn9h9v369gVGjzM4jUgkX4uiQFZq74idExC150TyK8AhxnJpfltVe+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+8B4PwzEXyyPYdVFjr7RvdiPpD9oXQFDGKSVk7jz17C4P5HKF
	iJO8TnNJczRdb0rUBEEL8iRPFl+TX45fqtQL0qZJaKMsSgfdSLtuk4vmjPwKgsRApb00gMsX68F
	dnfaIhO+theuai/0kRu15qaAkdU/sbBBnS1sFHxIkB+GyNG16QUZFcHGicKkHJORf3ia2P7akgl
	F2A91xQahciIMYUJ7YXv6wpr98ZlS/cHaEdZJmmhJHwafPt5wMjpg=
X-Gm-Gg: Acq92OFcUtq+bW/Vy48hWCnZULInWGMNAJ5M2IWPiK6g7ZctSOjKTKS+VGhpIGRKHD3
	+oF10NT9I8xsHz04Pl+YlaTHg7ODZQDcf58FFHOzin7mu/PqQLF1z1h9mdSF1qS4BfyotWPlxXt
	HqxUUeenZ+5lmLJLlYSXZLDp7Hz07esmRzb4qK4qcvEmhssmfAfgrEOuj/cODPRIN1ASCQDXWg4
	5yDTIpGFtYtExiHLuXvGFv5hKHbTQ7yuwg5FIeXVsN9ftd6UJddzO1LjqZ/q5If083v7VCTMXrT
	JxUMUwWkDp85wuYoHsrI
X-Received: by 2002:a05:622a:a94b:b0:517:6665:2a9a with SMTP id d75a77b69052e-517fe489005mr22671351cf.50.1781258858672;
        Fri, 12 Jun 2026 03:07:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:915:bac0:fc2d with SMTP id
 af79cd13be357-9161bc13cc7mr245131985a.7.1781258430139; Fri, 12 Jun 2026
 03:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com> <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
In-Reply-To: <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:00:19 +0200
X-Gm-Features: AVVi8CcCaLmOad_JBtnFjekoAUWHpnzgbbLT7l_V3SVx5j2zNp67A6Sx6we9iz0
Message-ID: <CAFEp6-3Z92KNVv6hbG_zrzan4+cP-TCkoc693orKwvQyvP_YHA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA5MSBTYWx0ZWRfX5zjAkFyXdmVr
 TmcCYA9V+eSwq1E8Gr/a3jFVSUPxpaNAs48OkGmybprqLfcYofh3PY6wWF69F8oUZIYdvwF4gQB
 YzUDQQXzyaJ2vYAUYigpY0ccmamCkdk=
X-Proofpoint-GUID: ZlrCxlAyAHMpC7qn2nTfyzsn9fVHyKvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA5MSBTYWx0ZWRfX4Wk7aYHAHzac
 a+qitlbPYGaTWjAQ0MDXGTasNrXZLzUvYoleu+FIuEJnBT/YqlYNv8oYE3ieKzKRQj/KOf6/XC7
 L+K5ZgylcZIHHM2OHxruntFwrAUOrM1tRxy7hlECn/MBv+Y2Jv2ukPcvW0kDIaeOSNPfyYrDa1O
 HUMYdDh6xCeMB7jRJyd4Pj84m/oqFDJeGcynjIHEvzfR/VKJfuxNlsvxyCUQF0vvjWuzCBHhi7F
 VM+QpvT2pvzPT9s3lmPtX8wSeLuukJ4W4OtpaBCqRI4KtJlxAn+Z9NBjOhRJZ7Sk5tu/WxImJ+t
 xi8zFkkl0NXq35tQBIa7VqmKQqfIwFJlYSduLBPAjneKxtCqaJvOIDIzBrJdnbzhK0rA2r5E336
 BAuQFjy41XTbR0iZm31EjpuC9weLwD+3j/Or1+wpbGdDVD+7GghgtmjgRvdNqXvMxdq0p3wCKw+
 qNm++gex9xDEDo3xGWw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bda6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=dtGr58D_ptlPQ1E9saEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZlrCxlAyAHMpC7qn2nTfyzsn9fVHyKvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112921-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk,vger.kernel.org,lists.infradead.org,makrotopia.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 201066789B6

On Fri, Jun 12, 2026 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jun 09, 2026 at 09:52:31AM +0200, Loic Poulain wrote:
> > Some devices store the Bluetooth BD address in non-volatile
> > memory, which can be accessed through the NVMEM framework.
> > Similar to Ethernet or WiFi MAC addresses, add support for
> > reading the BD address from a 'local-bd-address' NVMEM cell.
> >
> > As with the device-tree provided BD address, add a quirk to
> > indicate whether a device or platform should attempt to read
> > the address from NVMEM when no valid in-chip address is present.
> > Also add a quirk to indicate if the address is stored in
> > big-endian byte order.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  include/net/bluetooth/hci.h | 18 ++++++++++++++++++
> >  net/bluetooth/hci_sync.c    | 39 +++++++++++++++++++++++++++++++++++++=
+-
> >  2 files changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> > index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75ede=
b5f6a99fb98ce4cc6 100644
> > --- a/include/net/bluetooth/hci.h
> > +++ b/include/net/bluetooth/hci.h
> > @@ -164,6 +164,24 @@ enum {
> >        */
> >       HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
> >
> > +     /* When this quirk is set, the public Bluetooth address
> > +      * initially reported by HCI Read BD Address command
> > +      * is considered invalid. The public BD Address can be
> > +      * retrieved via a 'local-bd-address' NVMEM cell.
>
> Why do we need a quirk here? Can't we always assume that if there is an
> NVMEM cell, it contains a correct address, even if HCI command returned
> a seemingly-sensible one?

The pattern follows HCI_QUIRK_USE_BDADDR_PROPERTY, the quirk indicates
that the address returned by the HCI Read BD Address command is
invalid and should be overridden using a fwnode property. Without this
quirk, even a valid fwnode-provided address is ignored. So here this
is primarily done to align with that established behavior, although
whether that design choice is ideal is a good question.

This also raises the question of why an explicit HCI_QUIRK_USE_* flag
is required to allow reading from NVMEM when the controller-provided
address is known to be invalid, rather than attempting to use any
available backend (fwnode-prop or NVMEM). but this remains
consistent with the behavior established by the fwnode-based quirk.

So, I think these aspects could be revisited in a Bluetooth follow-up
series if there is interest in reworking the overall addr fallback
design.

Regards,
Loic



>
> > +      *
> > +      * This quirk can be set before hci_register_dev is called or
> > +      * during the hdev->setup vendor callback.
> > +      */
> > +     HCI_QUIRK_USE_BDADDR_NVMEM,
> > +
> > +     /* When this quirk is set, the Bluetooth Device Address provided =
by
> > +      * the 'local-bd-address' NVMEM is stored in big-endian order.
> > +      *
> > +      * This quirk can be set before hci_register_dev is called or
> > +      * during the hdev->setup vendor callback.
> > +      */
> > +     HCI_QUIRK_BDADDR_NVMEM_BE,
>
> Also, is this necessary? Are the devices which store the address in the
> wrong format in the NVMEM?
>
> > +
> >       /* When this quirk is set, the duplicate filtering during
> >        * scanning is based on Bluetooth devices addresses. To allow
> >        * RSSI based updates, restart scanning if needed.
>
> --
> With best wishes
> Dmitry

