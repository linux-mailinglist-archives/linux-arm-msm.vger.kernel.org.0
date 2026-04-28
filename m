Return-Path: <linux-arm-msm+bounces-104867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBAvDOJJ8GmIRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:47:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29D47DC1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88DFB3021E9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E09274B23;
	Tue, 28 Apr 2026 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVJM4Ysl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRB7959S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1792AD2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355231; cv=pass; b=bBPtkZ/Y9+PY/6T2hNTkEE0AIDQMp4xAL5lu3rt7W8Kc3XixAlxEEVe1LuQGESqqIb0hjbeC6A15nYxNsVe30L5g6cO4vFPP7FZ0NOZrKXyWjzagUMSE8qzKzsStu7woJVoJvi3Gz2LoDit7IN8WZ8ffyWryXoOHYu+SuWvxfQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355231; c=relaxed/simple;
	bh=mlMqdXFriR1NPOu++ehwnapqTjBgv5WcCndQlg95xUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLhm4MiBmd9kYLdkS5MMnDMBFXezL7VRWypW6ChqijHswBV4gsFLxsQ9Mm0m7+4uTxCkTEwe32Hm/NjzUcpPFKJZiGeF7a5E/7Og3cFtgrxnAHvUjNvy0Y3mjCei2q7tdknXcDh1EaDugw7h8xIuWcr8LzFmnmiH1WaXGn/VB5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVJM4Ysl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRB7959S; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4K3X52382817
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	904MNvmo4S/voCKmtIZIg0Hvxx0Xe/N1YqgI1M2/QbI=; b=dVJM4YslGSenrGrz
	dFvK6y6Ib/j/FMHv4J5DcEMjHIEascpkTwZ9y4xeEFgva+kgCN1ReHjJ4Ua3z2lL
	wKskdIrUYED+N/sHnAPcwKeHxMCPy4UtRLtZaLsfsFyd6wFIEP6c0QACma2KJ2LT
	oAooIib6vQ0WJ+ImC+76z3B1tL2nybXaMEKMgn9C9nXaZLi4uAEoUxchoBJs4vd6
	mDQxVeeTofYhXoDC81jmsCZ2HRrab3jCKbMbbpuom79ox6SARxqprR0jS8csyybL
	LQf0uy+h5Lx2pFIeN5Xu/PQWpvDIW9IEA0lSb+/tXRNc7ASfvy1Y0Hsegy6k/aZL
	LfwOtw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xuejw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:47:08 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7949310b90cso207142547b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 22:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777355228; cv=none;
        d=google.com; s=arc-20240605;
        b=M2yPvDJWsvmoR90qT2uO87UYMi6+xDR1hWEUJ3wt+ex8gc34S1BfvL4ywyUhDDnzz1
         yWq0t0loDa5IWQ+x5ErYh0plwiyJStWF0qBldEHMkwgBUm1cnKTap70THjDaREv7XgNb
         ylFuDXfmmfAsEBZdPGo8axDC0ImwH6sbaTUepQ9Y/HRXWZnK12Tqc22A/leETPKXTIQJ
         31jicg7kspT6Ecv1OaHyIORcU7yF+5T/CcwDglnK81OAxdNaHHD3An21xlJeRfNVfkHQ
         rDQMdnh3neuV+u29jTT/A+WBzbmxRhugl8eYT9hK+DtZQyysenM7v8nFrtH9a7NAeHYl
         XKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=904MNvmo4S/voCKmtIZIg0Hvxx0Xe/N1YqgI1M2/QbI=;
        fh=KDTBS/+bBoFy0pBhIfw8w2cGxNTu1d6gBFlbRJMK7Ws=;
        b=DMtfbTNz9KIY4E3TIY1pzCb807xEap8NTR/xMIQBQIExUIsy0DMvLc6nd50b3p1n3i
         CwaUu9PeBYxrjl28IJFvZiIqPNWjTEUwKe0sogp+d4BrBmLMPaN4cYcWO921uhvybLS8
         pFU/E6zXGm+U/EXqyJv8qdjuTOO/41QiRg2lbFml7glumOajsiFCDuHbBFh26W4DtdDu
         cHv9DlfK8YubjjomBQUZBJEO3W97PuGQ7+4fqRjKXCGlkkgmyzx5xhhvy2KIXXcWpoP4
         LxyQsJtf5jmnHTTHxwxnV6KN2P5G1SoVSE1AQkWobR3igslMtP45mdKLLqUs1d+WMZ52
         XVOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777355228; x=1777960028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=904MNvmo4S/voCKmtIZIg0Hvxx0Xe/N1YqgI1M2/QbI=;
        b=iRB7959S7RhRk0zW9v7eNDBieOqyhfKXf3h3q0iHdeDToFr/jMTSFPTxF/6BDtlk47
         hT1nl2QGOnbXmODRTYA2VUjJzqEOfpYwJvMnk/qH9cnjNHfrHk7w3yv6ssIX+g1eVglb
         3jnrWc/K1sfkMK4vaz+EjomwnHxYMqyMwtd8oYv4xl5JHN7WBMkWKAcuORZOZ0Zn+pLw
         C45htYNjfr5BKmb+MwuzLio9bo2/7d3Du0Ky1VOE22qWHAE3ovgZbOVOb3xa4xOX1UFT
         /lHTGs04O790WRUudY7HOxbSFPa/+R3gjyzDDCfZYcQbMYHl58VnAWVh3R/zbwo0yzPJ
         Dqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355228; x=1777960028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=904MNvmo4S/voCKmtIZIg0Hvxx0Xe/N1YqgI1M2/QbI=;
        b=b8eb1DLKj18gPSauMYgp6UpsVfqHjT5f8vgKEcRe7l1+2TG57QGNSMIrcc4UEqRKt0
         amwBi6FJvr88sYoeFyoTDlsb5bZgSKPjb/oOgXzQYRZXUjRZzwqMQkw5YtA0MK7Rpa0s
         7r3i9/zImjv0JK+78PjBpk4dhDveL6B1NLVDtmcUd0h4ddF0pxgT3PDgvdEBMVZ56TlK
         DuoL/ECIjb6nGnXT7vb8VzzTMxPkWqWHjOK1hbkSukTykZ3ilj6yCTJzlzOWtxFB1Bw7
         b3o2s+Erjr05nFqSW61jZxVOf2Hr7re4LqR8/n5INDkMIyhMJ7snLO80ksZUF0xRdL+6
         Hkcg==
X-Forwarded-Encrypted: i=1; AFNElJ/BireI4sZb43EqMVF0cTt9CAAxUkGfGZ3ex2EArWFCDqo7ETm5C3HUAXepYup0XDyqUX4mDt2NSsmll6js@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbDolpNyC5idbN0lzuEAqtzg13dQTu+7+AxnQ5prm8NCIwCmw
	VAzKYglSrVAp9UA5qmybYLVvUUJIQ4Pg1MqGgO35cPSp7YLSC/PCNRGLRxF/VqcKnPlusMDu7bd
	nbQcKvE7zWeGMGZ3MoPJGjkZEvKIxkoC2fplcoNAqqZJxrJrdCUzECvq5lCVTOuLNxSMEVvRhZC
	xLo2BieGzjFCNjIgrdXhjQlsPNwfx3mopiU2snSrq+lr4=
X-Gm-Gg: AeBDietfuSyBbUivxaNXToCSjoZU4qtB8Ay9YwA3vSVdAgUE5M/VGCN7DJOAmSRuhRp
	sXNsrKmKllNi/EN/5BZGtfkw+WYaZlfWGnehND/MOt4obp5+9fl6iuEKx38Zp06fxx1rk/jIKvf
	948Q2UZtAp4JeMkZuDUb0qu/d9YLt12ktxyen97h6hRBayipOgZV7QAYSMA8ixYdx9dLvukztYK
	mmoCTP3q+di3f5BgmiimOuzQAaMEAPuYulTp+kAf5eEUzgpPOg=
X-Received: by 2002:a05:690c:87:b0:7b2:136d:2436 with SMTP id 00721157ae682-7bcf50d16b8mr15101667b3.8.1777355227920;
        Mon, 27 Apr 2026 22:47:07 -0700 (PDT)
X-Received: by 2002:a05:690c:87:b0:7b2:136d:2436 with SMTP id
 00721157ae682-7bcf50d16b8mr15101557b3.8.1777355227528; Mon, 27 Apr 2026
 22:47:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com> <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com> <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
In-Reply-To: <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:16:54 +0530
X-Gm-Features: AVHnY4IW-s7ZWmxCMcWomBKPRZTyXnt6XjkBi2QcMC6pnWY9-35jJ5-YLd-9OZw
Message-ID: <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69f049dc cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=TO9xln4AVH5IzxScuHwA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: ncCzHfiRVfR5wIm2l_jeNjYT2BpHQXqg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1MCBTYWx0ZWRfXwcAgLagamuSH
 VRbauu5kWOipE66xUk2lcBh3c0pQgXY4jsleGC6o6aVnpXFsH99QM9hdc+yR0mn7ktsXJPGHl09
 pBCmMj9wEOlDgF0UW1ifX6IeW5KfYGRaPM4++Z/QClR6NwSKzJl0nYcsHdtoyR6vg8M5UxAFW+9
 EZIBWpHwH0JPOYI65SqPMPYdjpzDPD1680PnS1TnhfK96WS1/Zd0rB2SdgM0SSbhM3n6WuJ7XPD
 F4tVirqV4Lc4j8ZbQdyNvCnT9aRjnQYkXjf9i0o8KA4FHmbaoaOV7UpyCUG2H4XwzNJYNggB3hi
 Aa6dTm9/jaNGoCHleoy0ZHBWCA6q242/orG3leSt0SRROeGxxbzl3gckMK/8/8+s8kEW0Gq4Z+h
 uMi3qg03mAyRk1tJdmxNtRrTc9X61m/LlVl0zB0QT3Jv9G00kry8y+LnGesCDX4CrInWtTYN6yg
 Z6jm98/qx2Dr62BHkcg==
X-Proofpoint-GUID: ncCzHfiRVfR5wIm2l_jeNjYT2BpHQXqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280050
X-Rspamd-Queue-Id: 6C29D47DC1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104867-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,88e3000:email]

On Wed, Apr 22, 2026 at 3:55=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-04-22 12:09:31, Konrad Dybcio wrote:
> > On 4/22/26 11:41 AM, Abel Vesa wrote:
> > > On 26-03-31 15:37:08, Konrad Dybcio wrote:
> > >> On 3/31/26 12:37 PM, Abel Vesa wrote:
> > >>> Describe the ADSP remoteproc node along with its dependencies, incl=
uding
> > >>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> > >>>
> > >>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QM=
P
> > >>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> > >>>
> > >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +         usb_hsphy: phy@88e3000 {
> > >>> +                 compatible =3D "qcom,eliza-snps-eusb2-phy",
> > >>> +                              "qcom,sm8550-snps-eusb2-phy";
> > >>> +                 reg =3D <0x0 0x088e3000 0x0 0x154>;
> > >>> +                 #phy-cells =3D <0>;
> > >>> +
> > >>> +                 clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> > >>
> > >> This is TCSR_USB2_CLKREF_EN
> > >
> > > Good point. Will fix.
> > >
> > >>
> > >>
> > >>> +         usb: usb@a600000 {
> > >>> +                 compatible =3D "qcom,eliza-dwc3", "qcom,snps-dwc3=
";
> > >>
> > >> Does the device suspend and resume successfully?
> > >
> > > Well, tested with pm_test devices and it does suspend and resume
> > > successfully, but there is this:
> > >
> > > [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> > >
> > > But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, o=
n
> > > all platforms that have them.
> >
> > Well it's not fatal, but ideally this wouldn't be there. Maybe you're m=
issing
> > some DWC quirk in the list, although it seems pretty long already. Perh=
aps
> > Wesley would know more.
>
> + Wesley
>

As per HPG and downstream, this is what needs to be done while entering sus=
pend:

1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
3. Set the following bits in the pwr_evnt_irq_stat_reg:
 a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
4. Wait for 3ms for PWR_EVNT_LPM_IN_L2_MASK to be set
5. If it is not set, then we can print the error
6. If its set, then we need to clear the bits.

Regards,
Krishna,

