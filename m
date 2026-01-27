Return-Path: <linux-arm-msm+bounces-90851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH3bFR7xeGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:08:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4B98339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 177833001CC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058203624B9;
	Tue, 27 Jan 2026 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvzjW8R+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gw8n2ZSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E1031AAAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533644; cv=pass; b=s+v4//9hL5LrUEJAcN5pqK8/Lj/TxE4dxS4RHPNWg/Yol1amt5SZmMNSb/3c/Z89YpsujfUpPRxoN1qSbEHM2B/xNtgaz57pubWw/NmGRxBckIB20QdBo6vd5nA1TacHUXJC6Ixzp/ZWIcdgnx9etr5lo+bAOlEp1ZAiSnWUqHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533644; c=relaxed/simple;
	bh=ohuvLcnMnvostswXlSUWGokrohwCEeSwLY0Aa8Bi2lA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsBhkLxzLqiWBY1JzbHL6+SFbFRkrYN/xng1c5G6j54aq3I4gzCInTfA5hCV1b+D2L+y5CSWIDMqK/tRXUGWOqGvloSu/8tls3gFcSrhiSSEd7fxbPCYhiyRGMXZC5KwUGsS7w/n3f8LQHyYcWIf6fSqi4/zePUm7kIJLMI8COM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvzjW8R+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gw8n2ZSs; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH5NBM171390
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohuvLcnMnvostswXlSUWGokrohwCEeSwLY0Aa8Bi2lA=; b=GvzjW8R+L/Z+9CAs
	qM0WJIdDGqkaFC9DhBFtMUabCfLFwesQqnMbxfJRu8QAEf9EwNQPzBRZ5CTv483x
	VpV6xQQn586PB4+yv0CEvw9Flo63InKCKFTUW4KtX8/TYQY/hrbJEhJoDfKuuc6l
	XY7OpxsOfWkr6YOahcV5E9XTuMkCLWYNg3Hi1+QhZNOrxmp2aMZUjeQGt8CB1A13
	UkGhvd2wTiEVEYNTZNf5OSnWfkTG6GSFA6WQhXXh4niabGRFMgyijWaOrOiIyGtq
	EZWFK0IO5UUPoDzCH6mhnOMp3/Y6S/bP1qKofUpJbPIDwmIIl5Npc7vIXTitKl/Z
	u4wFJA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3rx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:07:22 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6495d7d6a30so6512070d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769533641; cv=none;
        d=google.com; s=arc-20240605;
        b=H4oerDBOigsHY9YF/TDqCZnX9fD9OPywRuS4dTvii+RqucZbEUR0weVRjRPZk9kbcs
         CATYbpLZKlGcOChiIev1oxBRMI5nXXJHr4A9lLLpvQ9MyKc2xDfENZgp8FOr+R8vq5R+
         3Hm+/RTEftfXhbtsk5eTF9lpUs9gPEq+Pi3q63uVgV73cqj0aInXKd6Aa9kWFLJy+UPM
         m9UkYWoPr1ET6J0EviZ1m/GY+xmwCs9RXacuv+WddqI0Y7opnsX5b60qsXdyWhNchQUD
         /smjBK4IXZCoYJQRvC9W+I0I1WcXZEafegxiTIXGZaNEXhqMnAFRtUtPUfboNe3EMWl9
         Mb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ohuvLcnMnvostswXlSUWGokrohwCEeSwLY0Aa8Bi2lA=;
        fh=Sr5HsMzeECNExnnb+aJ1NBv68QtQNvSkqIhthDQ8PrE=;
        b=ZjwucAJAZLDWhuxBCjDYCkCniCHc+vPlkxgFPacAhBMQ9WckDL9moTFF/uw9oTDGO7
         yMgKpaJxqOZEtayHI/GhwXh64IRQ2M9StToDI8B+oFGIo0Xh1VQr9oTCFuxm3JmkQzSf
         0WPA39MgEf3TLzpIGey0HCrcGvD1AWUBlZ29KQQUawWo5znAYIuGOHeu9Si5GVEfwhou
         ZG+wioogwnLWxgi1Q+fphmHM2nffPvCDgkcKN6icy0xecv0I7IPGOjzmvGRNQbGMUIUu
         k+Q/ylPZ5LpqWvGhaqkXjwMbUtEKJA/EFvQAhQ2aF6/zsDQPRSI/AnAc6LcKRLUSGNmm
         yp/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533641; x=1770138441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohuvLcnMnvostswXlSUWGokrohwCEeSwLY0Aa8Bi2lA=;
        b=Gw8n2ZSsI0usrYKBQkTgH/K5zgOUAD0FD6hnOFX0A3BQnJwYVRzvXnutr/ZgSTKn2+
         +/hMy3bY8dUF1rY4/4obUMtkVeO5/yZf7QY9MGPuLIo2UP5sz3RjUaZifyc0jhROO5PI
         LzH7RVsjjY8Vw8C6PnZYs8JJyxje0qgPumlmybDO9E7WrhJBO0pQ4183APUehMHo8CDE
         V9OZmoMJ5+O0cOxK8pUnKHIP7hOlZtni6YQbAA5HyXweDTU/uCLZei+X5SMo6zAmOXiu
         Ai9+fF25zSVIO1YFtnzHgnMVPOf+YSTrOk0yZNPxvN7Dyr7QHfcC126sPAtiIZ1mGVPV
         c6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533641; x=1770138441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ohuvLcnMnvostswXlSUWGokrohwCEeSwLY0Aa8Bi2lA=;
        b=LXwVQ8qr0mkDX8svoGTNsKbnRPznDmOutYdI0kDc/Fnrx3qffVbpmYA0baaMNX04en
         Xem3l4zChk+0mbRcoP0FAyrvqW1s4WNwpnb9j22wmwFtCwwI0gkI5dz0W8FPVlP6Aq16
         AEKLPPNL8hNbfxtuH9p9VT+NSpT6hdVkOzMtXbxqIzJStdIVzV5lJuxgngPij1/Ci/Jg
         z7Ameqn/5dWT1KaYW9xu9GJt5at3FC3NHWZaO/5Sjsw0KXUOV90i8YRs4F72KohDhmvs
         KyYUd/HglmEEqwzbo/qQbg42ezhCczST6nJ3QjiyzmvKG1DLsqjHwwoKPA8np5Lj0r4W
         8g3w==
X-Forwarded-Encrypted: i=1; AJvYcCVyrxwAO2AXoJMv25v0PdKzc1s9ICWcDUIn8xuL/H+etZagkoXC5i05fkHSjp197cW9MvDKFIFOr0HsQG9c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3BRxIwBwOhNxFYL7a8pRvN7oO+DxFsh6WZMq1uahTuUh8ACv
	C5h6IgpjR5knS9Ak2PIc52oqUxJ3gBUJsFWwHf4SAr1lv3VsI0MXMEQZ5zWCJf3BmlfpnNJMq8n
	A6MJ/eMo8aHwIvzFXzpu29rqs0e499JykQEaczyzymWveOo159DvofCSndo2p0db73DzfQpu33F
	nX5tX0iHNJiwaw4y5U1IGweMriCjPW2LMEjh4+iuDT+IQ=
X-Gm-Gg: AZuq6aI9M/1U4alvbn11fHLKCG7gqkodcOhjpLGA7zctujKfLjvKg7BcXFhiklYFJrH
	JXPjWQ/lteXFhPgXQhQeI2oHFpwVcEdJP2Ns6NHWLLZbnSOlCrWggTs2pjYyFQ/35LhZP60dbkD
	7b8SqJdxmh/jTDs3ls3ur5DI8knPPHSDQ/uDfTlLXP4k4QTvI9SZiWTZNjRE7/xbii1lc=
X-Received: by 2002:a05:690e:12c8:b0:640:ce83:c29d with SMTP id 956f58d0204a3-6498fbd6376mr1630610d50.14.1769533641394;
        Tue, 27 Jan 2026 09:07:21 -0800 (PST)
X-Received: by 2002:a05:690e:12c8:b0:640:ce83:c29d with SMTP id
 956f58d0204a3-6498fbd6376mr1630587d50.14.1769533641001; Tue, 27 Jan 2026
 09:07:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com>
 <20260127155537.4088709-2-krishna.kurapati@oss.qualcomm.com> <yxpb23ffawznmb3syb7k23kz3lcnk6ta7ppaw5wcq3s6witkoc@qnakpsylbuyu>
In-Reply-To: <yxpb23ffawznmb3syb7k23kz3lcnk6ta7ppaw5wcq3s6witkoc@qnakpsylbuyu>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 22:37:09 +0530
X-Gm-Features: AZwV_QjaU32-H0HQxoNl2lLSc7ZGO-OE_Vzg4xUuZ8sox544KPJEEnp1ksNKNtM
Message-ID: <CAEiyvpr0y3we-4V=r_0pLT5b=0Kyn=_CfrpokQ85WXP6Pr0WOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: talos: Mark usb controllers are
 wakeup capable devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzOCBTYWx0ZWRfX/UyrZmd6qV59
 AQpoZoII9jGrAnEQjL9ohwNkbZHBlJmLJQMplrWtFSpGusvH7Cd7TaSUOjKgpVwefpaUVPhBeV/
 5l1ZsKw/TFhJcD3augIZ+TjxKbkTWf9Zq3/DlAMm3+ZKXpruNfahlTeRR7EZX0aB6MZ6EyYWxju
 cQmGscgZdpqAti2Ii63/p/spjaeVtkRXBMacMJi0RAbrsWPzylHlxKDaFx2zpwVYJcPcxZ88rp7
 r3/A9aWshk6HN0tb7WPNw+pQYRmX3HwjgLR5ldUCYYl419FBQSQveve1WVki0heDftxg85dER+t
 8c1t43YDO14vTXXBhVK72+PpqfBDRSvO2R3zSRwK2veKa2ojB8bBEQSs8PH1vvh+1Zs1f6XbL9d
 Ks6t17v6TK+p19/q2P3CIvAL67ykDdW6qvcDoVcfhDkTydxrayA+ufFmZ6j/IZIQmxejrrBjZWe
 p0EKSPw5NKtPpHuo/Uw==
X-Proofpoint-ORIG-GUID: 3v359P6WEk2UAFCesX4R1J9QtsbUL6uT
X-Proofpoint-GUID: 3v359P6WEk2UAFCesX4R1J9QtsbUL6uT
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978f0ca cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=H6nDv8bb9oMGCCXUEtEA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90851-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7BD4B98339
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:21=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jan 27, 2026 at 09:25:36PM +0530, Krishna Kurapati wrote:
> > USB controllers on talos are wakeup capable. Hence add wakeup-source
> > property to both controller nodes.
>
> The order of patches should be exactly opposite: first refactor, then
> add new features.
>

ACK.
Will send v2 reversing order of patches. Also will retain your RB on
second patch after fixing order.

Regards,
Krishna,

