Return-Path: <linux-arm-msm+bounces-118436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 25hpIpzEUWoPIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 06:20:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F97404BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 06:20:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XooQqI6r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UFpMz354;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 397783030F67
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 04:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8502882C5;
	Sat, 11 Jul 2026 04:20:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640261E1E12
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 04:20:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783743642; cv=none; b=irm05HFbPTNNmUvjio4ojvc+vZ8OkhrCUUkgEazgOTELF51caSP2ZlUPvXEAU88AWf+tgouZPLxu6DuDotp78hG+Wm8LrZhW+wu92pW08BDRRPMU+I5LQMVYCKz0dl7uviTLgVaVbLahhNn4+7RuV6f+RFa/MQIlTaCyBUwcxJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783743642; c=relaxed/simple;
	bh=NKr1AKgUDdEeQiIrpLGJtXvRcBzklGP0wTV1XmgZN4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lCapzXsQeNo1D8WwBnRtwqGDRqgiGyK2CEvd+PcZVAkv+cfTSCEY30JWSc8clI5WG2g62GoJRug434oCTn09XpGa/onLVyjUSoL9nPEko5i9Nu8zDtsytN9j7/sTk0WWelMxXKkhXBvQfSpmi0BfTLy14t+TM0BlUC9NPWdABcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XooQqI6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFpMz354; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B4BZFU2728828
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 04:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m8eMuykTYfIuguRt2w9yVz
	ZwA1GQ7CYMANsq/rQlM68=; b=XooQqI6rf8IKU1iAInqu+EIzXQ76PV8ej/geOZ
	OB/I2qKtrOTJ5pYaLisTpdSQ6FAgKjM+JeOBl8fKRMQ7DcLytv2OB7dHLGBKou0X
	ycdgm4KquA7LLW7gopUQCk5DWpVXGPZyLSGNw5oYJCWyburp6xDePZwvBBH0KPk0
	3RKdWuVBcKqfn1VSK7NaEEX6lehF+ViP6Oi7H3Cauyz1jkgm0uCKmVM6hCN6zQki
	C9oRuVc23/28VNr762AWH6wO4yf94hq4jLUZ+pPtXCJLUOtr7ft0cthqbx0igYO1
	EvxGcyUr68PXeBt/0EXXyLI0aReh8YL5fjGXp4c/q9eQ1bIw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcg0gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 04:20:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1268490a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783743639; x=1784348439; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m8eMuykTYfIuguRt2w9yVzZwA1GQ7CYMANsq/rQlM68=;
        b=UFpMz354Hx0n4sys2v0Ah/11+qGj8qYdZxY7wZAq6wHaCFiPKbZ5LZzTni9zem0YWF
         zp8NlQE0RjoFsscdhPiXu7bPium25Fo8dCsJfQ4k/I+iGEmDi3xN7P2/fxxjlIwzsho6
         2hq2iiuK9KzKnaRyy+Eq10VbgAPJYfIbb0LsOXq75HNtz2j428rX5jYfo6bTeJGszcmG
         +HEexH8IWb+nFyVI1YlExd1D6FqK5Yq8eiLTdgzeeB57fzQgmwLXDrMqRU9bvwqW/Hbk
         2bC4RxT0U3NKU1DkZ3cOsxgiBG9xo054zMjUruhWB9rHNviFEixpT3v9eCyMrW+e6BS0
         Z7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783743639; x=1784348439;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m8eMuykTYfIuguRt2w9yVzZwA1GQ7CYMANsq/rQlM68=;
        b=s9EwBkZ13DGpLQasdsD7roMQ1VsWya1gBIZyG0cL7j/RTt9twQxTUUV281Sf2K7wV4
         oGk6kVJiEfs3akJbrqh5dVNYV1EseDxDDAWizvaIigAPlfd5/yn2xvDTtaHEUv90mUHR
         7BzHEnlRZxDcfdM9d1rfKEp5pR81kLtPsCXmg4e9Hl7r59sc1UDb+Zbg3KayWeWnb+vd
         i1XHf7EXQ4JSrxXaE1q4vLyV4OeLRRcn9kr23CzJbdtSc8bUYDr9Bbrc+gmOaModxWYt
         RSucvSIneCWt0kl+sMB3d0Dnk+pEF6uDs8yH4E1iCayBsvkowU3WHj7cuypRaquE+AY5
         rJVA==
X-Gm-Message-State: AOJu0YweAkuy3v/XXU6rCZWA/WlAI6VejNqO68ZUvBbPYU85TVix90J6
	J0Og9Dzi7JAS3Hko5lLAkilABSMr5WaAYhyOvEDlPlqqE3Ct5W6sexNQOhnK+g1LaM84rEez9YR
	tykOrjUSTedBr5PbIHlYC+a3O/u0Opar+XqQi1zc4YCkxKRNjdEzIyLf2Kf15C9BOO1II
X-Gm-Gg: AfdE7ckujMRAzBxY2/aOZSAoCLQ7iUS8t/dVp8GJMe8o5OMXzsmUOjsQbofgh8elmKK
	skId+Ym7rl0GO0W6UeQmrujkexf4OJMlUrYhftPcXLaJydt8xhDkUlLYzGFDyD8lN55GdmOFBcM
	aINAqkNnoeLfNSSALghEsv4ebUpUjRQb9cLfgUiO/R2KM5MhQ/mU90/SZDY44gdQTIthaCwyYRu
	wW07BwBlxUwB7I612lBVI7VcJlTXPjCIedNJTYfUQ7bjmbPAoXwG/GLQKj6hz4sc82CdVDWMuvx
	Ll1OTRS0Q4apx59QlM7oceBWbe8YDw2FYAu7GktNC0exJ/4P45zD0S6P/ZfFMhTdxX6aU2nRmgg
	AJhgcGS1zO5lmHEQ6hQYFNXvTeg4RGS7rRq2wFmRPw+XvlMg=
X-Received: by 2002:a05:6a21:9211:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c110777a37mr1813372637.20.1783743638904;
        Fri, 10 Jul 2026 21:20:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:9211:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c110777a37mr1813355637.20.1783743638434;
        Fri, 10 Jul 2026 21:20:38 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm43455894c88.0.2026.07.10.21.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:20:38 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:50:17 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Add BAM-DMUX support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIbEUWoC/3VRSYoCMRS9imTdXzKnqlbeoxHJ8KNBy9KkLGzEu
 3ccGl3Ymw8v8MZcSMGcsJBudiEZp1TSsK+Af82I39j9GiGFigmnXFNNBRz90EPZpG22EMYCzvY
 Q+tMZTAzeOR2d1pxU+iFjTOe79PfygTMeT9VhfDy+DKrfTV7y9k957T3kQ1+v320LcNpKDDFG4
 Wg3KfKe7klWXD7JKzyUstoJUJzbiDK6JqpuEh9ZjL3KQDAqtEYqqaXuJvPZRr0Rega04QG9aDi
 a+IzmbEGoM/Vp7GYaG6mcd6bxrbKxFap2oZK6UBt54bnTIZhGkttGm1TGIf/cf2Ni95Eew9eY/
 w4/MWAgRaCuHskwLoZS5seT3d0yzOshy+v1+gtJV/3m6wEAAA==
X-Change-ID: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, stephan.gerhold@linaro.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783743634; l=5620;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=NKr1AKgUDdEeQiIrpLGJtXvRcBzklGP0wTV1XmgZN4k=;
 b=Qv4qTtzRftilleMFXeh6SyVjuN3xN+oGggROpZ2VFBa+68bG+8JyjSVVhQx9aYet3sK8T4Mx2
 felvEmyeDqDCB0J3RFURByTm8Uvkv07EWCgqidtZBmVfnZBxS5TNOWz
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzNiBTYWx0ZWRfX83bT9G73Z9p9
 ztz+O78Q5EXqc2E90IQjyOGyyVUNW1KMm3QbhGJeqOllwZMU9EA1LCnho9LWDkM/2szaHh8hl0p
 r/AL1KFUoHHSIO3b8ll3FDEgrqqsB1NS3z7X6eQPhlhLvT+i0t8WtUcGEP9WrD2rVK73lJ8pN8T
 A8R+mnoWZMcNBO9dQwxTo2W3XkibVAAUawKk1w4i7/7aUNYC7sh2FuxflJZaJ5XX/WdamT0Lh1X
 DqdJU3uzRJqnWT4+anm/C/SmKTt1pfWqjfTBw9aHl2534c/molTf3vIVVvad1uLh/tETEK2ik9z
 PnETAtJ58BTCRRLeoDZJaWFRbNsN4TQUyvZpstKes9JjQGU4AzC7oHfWmhve0337erx47avGKwk
 Fbps4Mr/W0pXjnR6Fdwl/Z8EZdWa8IQgIigVQVn3d+n2nDUmEMBPRX6D5JbzQBUBB52OzwKcV7F
 ToRXXgBXQja3hQ4RyvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzNiBTYWx0ZWRfX5IvSIYbYUALi
 KgrGE6tsLe/0CLPfa3cbporbOAtSmoAZkT2mUY4CeW7oa6oGIX/Di756qGAvOJtEaplFmrmJSpu
 FnFFlo4NsUrd6qmpUeIJA4YP0DGjrg8=
X-Proofpoint-GUID: 5op0Cxc_XXZ1nxLeyGYJCAY8_X8hr2de
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a51c497 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FrY2Icr_-yWe-lCAmnUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5op0Cxc_XXZ1nxLeyGYJCAY8_X8hr2de
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118436-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:vishnu.santhosh@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 385F97404BC

Add required nodes to enable the upstream BAM-DMUX WWAN driver on
Qualcomm Shikra SoC.

The SMSM (Shared Memory State Machine) node provides the power
control signaling between the AP and modem for BAM-DMUX. The
BAM DMA controller node describes the A2 modem BAM hardware as a
standard DMA controller. The BAM-DMUX node references the DMA
channels and the pc/pc-ack interrupt lines from the modem SMSM
entry for power control signaling.

The BAM-DMUX node is placed below the modem remoteproc so that
userspace can associate the resulting network interfaces with the
owning remoteproc via udev/sysfs, matching how qcom_q6v5_mss.c
already handles the equivalent node on older SoCs.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
This depends on the "arm64: dts: qcom: Extend Shikra device tree
with CDSP, LPAICP, MPSS remoteproc PAS and peripherals" series [1],
which is still under review and adds the "remoteproc_mpss" node this
series now attaches to.

The corresponding qcom_q6v5_pas.c change that makes the nested
"qcom,bam-dmux" node actually probe is being sent separately, since
it has no device tree dependency.

[1] https://lore.kernel.org/all/20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com/

Changes in v2:
- Move the "bam-dmux" node below the modem remoteproc
  ("remoteproc_mpss"), instead of at the root, so that userspace can
  associate the resulting network interfaces with the owning
  remoteproc via udev/sysfs (Stephan)
- Add the "shikra-dt-m1" series as a declared prerequisite, since it
  introduces the "remoteproc_mpss" node this series now depends on
- Link to v1: https://lore.kernel.org/r/20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 205814c4b349ae19b605688357c6bd71e1ee61e9..246ea74d1fb1e293f0428d342301886dc52cb179 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -498,6 +498,28 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs_glb 13>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -1864,6 +1886,23 @@ glink-edge {
 				qcom,remote-pid = <1>;
 				label = "mpss";
 			};
+
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+
+				interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
+						      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc",
+						  "pc-ack";
+
+				qcom,smem-states = <&apps_smsm 1>,
+						   <&apps_smsm 11>;
+				qcom,smem-state-names = "pc",
+							"pc-ack";
+
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		remoteproc_cdsp: remoteproc@b300000 {
@@ -1990,6 +2029,18 @@ glink-edge {
 			};
 		};
 
+		bam_dmux_dma: dma-controller@6044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x06044000 0x0 0x19000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260524-shikra_epss_l3-522afe4fb8f5:v3
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v7
prerequisite-patch-id: aa4ff7fbddd4c8836ce69aab89f2f91430194fcf
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260525-shikra-dt-m1-082dec382e7f:v5
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


