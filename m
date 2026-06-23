Return-Path: <linux-arm-msm+bounces-114221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V9awC+ydOmoSBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:53:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3286B80A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:53:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YN1OOAZy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gzm0dAwT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9F3C3001865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D713C0A12;
	Tue, 23 Jun 2026 14:52:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D8326D51
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226351; cv=none; b=QusVsZUPJIe17zygtUGVrUY+EeEQ5jzZrmy2FGAja26mtYfk3Ua4LEozxOevCJMgPYkFnPLBcdmvS7YhfxJL4oVgP++bYXqfrxo3TX20Up9JF2BZ4II1EZ46VRnUG2gDfaVvf/5WRPwn+IFeDgVLIHgMsciwZDmmIJsRF2Dnusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226351; c=relaxed/simple;
	bh=oEaVrXfrGbUI1OQX0uVAToqqbHcY53ULqqKAGZ/siAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsA0dof4CX36HwaxUJxStQ5Z39X6VUKSmmJJJH3LmDsww8G1iL275mhuWAj2+qKZFSUU58McAofGJR+Q2J5GRIOf0Lp4xEwaQUls818+W4ThYi+LzNUSPV8H5qK5iRCdSn95p+W62M0hV5CJV7lv9+YVzkSxMtiXLjbjHm20uH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN1OOAZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzm0dAwT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZZM134196
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t/SHQ6KsrjjXD5Z/C3+Df01F1lTNP24v6t0
	4p0SPDpU=; b=YN1OOAZyJlFiT40oF+L0fMw4TmPJniQ6D4nch8ouwDmpw/S3KV4
	eptnLf+yFjrInGg+f/z/HnQsw1BW6vuX7oQJJW6ic6J6WBV4JYNxJodclA+QBOMM
	dulqAzemD8sALxqN92OaFln6PbKm9nlsx65UnC5rFurWnfss8hQVgGQoMd0XOe8n
	DagY3FnC1Erc+oLaZiB0ZIbyD9Mj1UFnfX0EX/rsNp2v/fzT6AmaGXiKvV/xFjY2
	R7i1GhC7YnLgio1/3Ma5BwOrYHRSArYtgvTEGPaNwh93cXEb6E2gtjgyJrfepp9P
	1O6JYhdrpylfA88KGLaqZUA0u1AwYqTyG9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3214wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c554284973so6935878137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226348; x=1782831148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/SHQ6KsrjjXD5Z/C3+Df01F1lTNP24v6t04p0SPDpU=;
        b=gzm0dAwTOQc+3sOXA8qVk5IJEENab8YX0naT7upgXt3i8o/eBTArUvsfFCxJ585Ksm
         UeGsDv7L3zahvDo0guv+EnbO2gdXzE5+xNA5daGiF2vjBRyxbEp8cHI9EvWWUHaRLnGa
         oo+P4PaWV5lMLK53J6iHLeDhMfKEbzg/z63AlC5ZGudB6WcVc8kDkEMb4wbZYr94m3oG
         P+tTZvzUetiC8XeCPkT6zljWVnqKkFj/KeDpwIFbGpx2xVBPXSCR3Iosp7yhGS+cJ/DJ
         iLTJTBezM9g/wI3R2asP/RUoxZ9ICjstUtAN9lwExFjURJEK2OUSL9jaMpSr+uGrrz1I
         MeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226348; x=1782831148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/SHQ6KsrjjXD5Z/C3+Df01F1lTNP24v6t04p0SPDpU=;
        b=NMjSiJGAqf7hzlfekec3KohYdfAlDUwDDoLQ1bMvcMvz3fYSjtFyPlKlZYlexiW9TA
         QuyolgWLESPL0lt6ytqft59Ww+fzCqzugMapUd3+ljGl2bDaarOlkZhU2YQ2EWOQOJSO
         Ir6POEAyWQjQUfwctXiAmj5iiSBG5nSohP9ZErw+OzImuJYHx5iC3ExzwSTG+YWpsU3r
         XN/RtYFpZlxxHiisXhJmsid7odDhoM0Y/m28kjIG/JFaK4o4AQTCb99MFXuaBDhNhMLC
         KZUb6Sbv1+LdxzSXXzHLnljt4rjRLkSPazvHKVwTmGxPxos+/BDxM0HwmqPokr9gFE/6
         SGvw==
X-Forwarded-Encrypted: i=1; AFNElJ93uSd6sJKVw1j7Dlkld0Lli4tBuH+ECp4+P7dVzd3T2vCOi1tqIwx/5jx+69J7IVCguXupNdljMsgNCFg+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/doTWNrOJa7WmwGEjb1eKS7NPBzVkotCWDox+FphJRqPGMd+i
	mgPJrsU1BL4/iGRwG29oZi0GkoJCkGQEXi+lRKAgylyYDaf8qLgREe3QjsKuhLqJVq/HZiOmnKb
	qpnX3i0txR6P+612zGLdMe/cMMCXvU95ybKHq9orgwcEfA7usqL294z1TOlBM7OQ6/efW
X-Gm-Gg: AfdE7cn7hlCvlW1QveTJUngq86X2ZTpJiwzgzDkv2SIJ1Oyg7CYWl3mEZyO8FlOknUQ
	K+w1LjpHxFsm7d1wuZ1ZSusUciWhWIc8/GtT39FqvBPd7sbOxS7jr5yPSj8p7n/mRbE94AYHtVh
	iey1cVJ7jvO4dngLad/FTuZxHP67jQGR/bVmai9bgnYETU2vQleAEE0m6xoDsUH/MMZAkdWUxWP
	x0zKlYwFpYyS8fla3idbgP4NfhiKmsoyrmLRPGPouoxq2B4vqhk8nrWyd51xAaFTTQMlq0gjZGH
	vhIodHTM35MFsZg56kGZWRtmDAtIaTrFqKszfRA4zrLBsCFoBk+J53VLZtvE1d3pj1TXg61Ssn+
	1EkKVClsStJX4Kgx2iv/VmdhxJh5HF6yWXzZ/rHJjsQj8FpiOgbkDbiu55cbKDH5Xg4vua7EjLW
	iVlft7XWEwksmYRebk9qQ9kpEgXg==
X-Received: by 2002:a05:6102:c89:b0:729:213f:76ca with SMTP id ada2fe7eead31-72a20215eaamr13204419137.29.1782226348050;
        Tue, 23 Jun 2026 07:52:28 -0700 (PDT)
X-Received: by 2002:a05:6102:c89:b0:729:213f:76ca with SMTP id ada2fe7eead31-72a20215eaamr13204386137.29.1782226347491;
        Tue, 23 Jun 2026 07:52:27 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:26 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
Date: Tue, 23 Jun 2026 16:52:13 +0200
Message-ID: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX3Yo25xF3PHa0
 IX+DgOTw1xhLGqdPaeUXU3QPm/rDObcKDXuGmP+d95QfnS+27n4X+uW2aV2jp3hre3MGe1yiBV8
 4FatUMu3wKqhBzepv2IseFH3DFdcss0=
X-Proofpoint-ORIG-GUID: kUK9T1vbf-OvhyDOazE35IDK5tKF-E0w
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a9dac cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=37uFLTumMtzLhuvrZfkA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX5+8HzBXMnrEv
 CbmPiAgXWUCRttaNhruHgwfAd25AI3gpIgTOat29KHgpD0mokxCMl0OLJScMxUTHwWld0i4NaBt
 fzy8aiL8nSgOmaRmHZDhQq+ELxl8llsZXcWfeUAu8JBgicEDsluxs5wkC5ZEKQpX8b1uHsbXQ8Q
 Nf0TIHaKmrf8noMNYY+rEpsB/FzyW2IXR66MdMASjpInseNn8eQnLrZai89+tQ9GLrdia/Ow/fV
 /qJIpldXaqJYJXnpLBU4OYOhH1Ilfwq/kOWj6pTsjkp/H1YNgkO7vIsCuohBzV003zg/ns2yIYo
 66LuqhHkomkGlg2Zo4M6C62/d2v6EA/iliccZ6+kTFTZcgQkSq9ndMyUq1QViEcyXWGfNRz1P1w
 JzH9mz/f1lWCwhaqubbmsAi/HhPb2BFJyb1asV7hKJFSK28JmLwmUBRWcoiYQSdAYxKo8ZEKbd2
 9KwC6jZTSzDE9NoqTzw==
X-Proofpoint-GUID: kUK9T1vbf-OvhyDOazE35IDK5tKF-E0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114221-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D3286B80A9

Hi All,

Currently as soon as the kernel boots with a populated DT provided then
the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
gets disabled. On WoA Snapdragon laptops where the factory Windows OS
actually boots using these tables this is not necessarily desirable.

It might still be interesting to at least parse the ACPI tables and make
the ACPI fwnodes available for device-drivers to use. I call this DT-ACPI
hybrid mode.

This mainly is an experiment for now and possibly a method for accelerating
the ongoing effort to run Linux on currently available Snapdragon laptops.

On current laptops Linux cannot boot using ACPI due to some information
missing from the ACPI tables. People are working on changing this so that
for future WoA Snapdragon laptops Linux can boot using ACPI only without
requiring Devicetree.


There are a couple of scenarios where DT-ACPI hybrid mode is useful:

a) This leads to a populated /sys/firmware/acpi/tables allowing one to run
acpidump, which is useful to grab info from the ACPI tables when e.g.
creating a DT for a new laptop model. As a bonus /sys/firmware/acpi/bgrt
is also populated allowing the boot-splash to show the vendor logo.

b) It might be useful for device-drivers to be able to access ACPI data
for the device even when running in DT mode. E.g. Srini Kandagatla first
got me thinking about this because he wants to use the ACPI MIPI SDCA
tables for audio codec routing when booting Linux on Windows Qualcomm X2
(Glymur) laptops.

c) It is also possible to go truely hybrid and use ACPI to instantiate
some of the kernel device objects representing the hardware. For example
the last patch in this RFC series switches to using ACPI instantiation for
the I2C clients for the keyboard and touchpad on the Snapdragon X1E Lenovo
ThinkPad T14s gen 6.

d) This may help identify shortcomings in the current ACPI tables which
need to be fixed to allow future laptop generations to use ACPI only.


Upstreaming of these patches (to upstream or not to upstream?).

1. The first couple of patches in this series mainly implement a) + b) from
above. This seems like something genuinely useful to have; and except for
missing DT-bindings for hybrid mode this seems mostly ready to go upstream.

2. I see c) as a way to slowly evolve support for current Snapdragon laptops
to use more and more info from ACPI and get closer to a point where we only
need a single DT describing the SoC and any info related to laptop model
specific bits outside of the SoC can be read from the ACPI tables.

As mentioned above work is being done to have Linux boot on future laptop
generations using ACPI only, so all this applies to currently available
Snapdragon laptop generations only.

The question is what to do wrt upstreaming patches necessary for c) though
(patches 7-12) are we going to allow new Devicetree files for not yet
supported laptop models to partially rely on ACPI?

The current demo ACPI usage in this RFC series just instantiates I2C-HID
devices from ACPI. More interesting would be to hookup the embedded
controller (EC) handling in the ACPI tables instead of having to write
a special EC driver for each laptop model separately. For the EC parts
I believe that it might be worthwhile to implement c).

This new DT-ACPI hybrid mode works as follows:

1. A new global ACPI subsys flag called acpi_dt_hybrid is introduced which
can be set to 1 combined with acpi_disabled=1. When this is done, then
despite acpi_disabled being set the ACPI tables will still get parsed and
/sys/firmware/acpi (tables) and /sys/bus/acpi/devices (fwnodes) will still
get populated. No devices will be instantiated, no fwnodes will get
attached to any other (e.g. PCI, USB) devices and no other actions will
be taken.

2. Add acpi=hybrid kernel-commandline option to the arch/arm64 code.
TODO: Add a DT-binding for selecting hybrid mode from Devicetree.

3. drivers/acpi/glue.c changes to support devices with an of_node as
primary fwnode having a "acpi-path" string property and when present look
up the ACPI fwnode for that path, e.g. "\\_SB.GIO0", "\\_SB.I2C1" and
set that fwnode as secondary node.

4. pinctrl-msm changes to map special WoA ACPI table virtual GPIO numbers
for PDC pins back to regular TLMM GPIO numbers.

5. Tiny drivers/i2c/i2c-core-acpi.c change to make it instantiate ACPI
described I2C clients under a DT instantiated I2C adapter if that
adapter has an ACPI secondary fwnode.

With this I can drop the DT description of the ThinkPad T14s gen 6
keyboard and touchpad and instead have these be instantiated by ACPI,
as shown in patch 12/12.

Comments, thoughts ?

Regards,

Hans


Hans de Goede (12):
  ACPI: Introduce DT-ACPI hybrid mode
  arm64: acpi: Cleanup acpi=[on|off|force] handling
  arm64: acpi: add acpi=hybrid support
  ACPI: Add helpers for dealing with ACPI fwnode as secondary fwnode
  ACPI: glue: Implement setting secondary-fwnode for DT-ACPI hybrid mode
  ACPI: scan: Retry acpi_device_notify() in DT-ACPI hybrid mode
  ACPI: Make device_match_acpi_handle() also check the secondary fwnode
  irqchip/gic-v3: Always call acpi_set_irq_model()
  pinctrl: qcom: Add support for WoA ACPI tables virtual TLMM pin
    numbers
  i2c: acpi: Also register ACPI i2c_clients for adapters with a
    secondary ACPI fwnode
  i2c: qcom-geni: Fall back to i2c_acpi_find_bus_speed()
  arm64: dts: qcom: x1e78100-thinkpad-t14s: Move keyb and touchpad to
    ACPI enumeration

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  61 +-----
 arch/arm64/include/asm/acpi.h                 |   1 +
 arch/arm64/kernel/acpi.c                      |  47 +++--
 arch/loongarch/include/asm/acpi.h             |   1 +
 arch/riscv/include/asm/acpi.h                 |   3 +-
 arch/x86/include/asm/acpi.h                   |   1 +
 drivers/acpi/acpi_apd.c                       |   3 +
 drivers/acpi/acpi_memhotplug.c                |   3 +
 drivers/acpi/acpi_processor.c                 |   3 +
 drivers/acpi/arm64/init.c                     |   2 +
 drivers/acpi/bus.c                            |   6 +-
 drivers/acpi/glue.c                           |  70 ++++++-
 drivers/acpi/property.c                       |  13 ++
 drivers/acpi/scan.c                           |  33 +++
 drivers/acpi/tables.c                         |   4 +-
 drivers/base/core.c                           |   4 +-
 drivers/firmware/efi/efi-bgrt.c               |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c            |  10 +-
 drivers/i2c/i2c-core-acpi.c                   |   8 +-
 drivers/irqchip/irq-gic-v3.c                  |  29 ++-
 drivers/pinctrl/qcom/Makefile                 |   4 +-
 drivers/pinctrl/qcom/pinctrl-msm-acpi.c       | 196 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.c            |  47 ++++-
 drivers/pinctrl/qcom/pinctrl-msm.h            |  35 ++++
 include/acpi/acpi_bus.h                       |  16 ++
 include/linux/acpi.h                          |  10 +
 26 files changed, 502 insertions(+), 110 deletions(-)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm-acpi.c

-- 
2.54.0


