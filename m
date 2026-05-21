Return-Path: <linux-arm-msm+bounces-108903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEC3LGdbDmo4+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7659D896
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B9FB30055FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093072BE7AC;
	Thu, 21 May 2026 01:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="it5K/Wjn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeFIJJKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10F2BDC32
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325793; cv=none; b=nC+j9wrLwWdG/9X5WwGlDe+5qA2Cy6o1zuGcWLML696ZmVPQ7Vb1+MlF4RPJY5s4WZlBRneDvSUAGQBVtQ6DOmN++UtOSb0h2AtG6uNKiNTNMhOuvTBIg0Kw2dGxSQgt/PVBNgqKRk6wMbFZIHcLFJWfTza1kOYrthIl6N6GHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325793; c=relaxed/simple;
	bh=EXQRhW/IvzjMIzr0CVbYF9vLiRbp2PMcWUTZN2P0wTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WQNpoPJJqiuTrimBTS/Rn1CEOtjDLuqYxPzSsaGdCvb4Oz0BmTg5SdjfhShouta/OcajiHHn4dkEw32zHJRMOdLKWNPGdwbKCisT0/CaeIkbtvJCqtPX6fYyp1l/Facp3vd2W2I2yP087yxyAcxKh12iw7A6l/9ykEAFK4LIGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=it5K/Wjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeFIJJKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGEKQB1178279
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+OBhukk0LdM1gR7M252L3/
	fOKTfD601zCAkg1K9NP3I=; b=it5K/Wjnd+7oB475M+VhNTMERKR0ET4GvMh2zn
	4a7EBuJyd0x/DnOh4VxOKRe0AqF+jpp1RKej139TxWiHMThNa6EJj54qRpg7Uhlv
	3YGlp+MgGmgB5O1+su+xPnBnlv7N480VlwElX2RHG9uvdFn7KGrgpp+7VMWlB6pD
	7yWobhmJaooDV5fqqqnbjjRCnUmFyP/tFi3ezCBNo2+FTrx8rW8jy55bj9Zih9xn
	Xkj5DCEGzwWiC62zE9Ce/e/qSL3/AIghZWmEqDM0DTdLxO6AY8TrFDQdro1FZzhE
	6vuz+I45TpGPLqHcZyie6v5POI98Yw5dG/p8Vd+r+F2knjcA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6u9an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:51 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd66ec877aso104692937b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325790; x=1779930590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OBhukk0LdM1gR7M252L3/fOKTfD601zCAkg1K9NP3I=;
        b=UeFIJJKc+8x9X4xGWaU0XURuxGDoISulw2JFy/kAWCHh7JFtWnK13+O9Qzh7CX0VNa
         oaqOExv8w/Ra4akA8ExFHpMDFHJXveeroPdOjOCqDkHnwImgqmmoqNaNJ6kZwR8KFGIy
         Wo0TEYiG15wsKATwGCX49yTbVhNpEQW2YQzNOHnx1AtNCiAbXbcIsYW5iC18JG73ikxu
         3w3a1HL57p5HViBjCjE1RNvwzySUpcm9SpU1+8s9DurIYgS3cZxrAia01N3M1GZZ/e6f
         D9y34KP7CUlIj/+BFYN0gSVvOP2RZimiohW1i1Rpixaj73rfmC8OxcOW9WrCLauhoNQs
         OE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325790; x=1779930590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OBhukk0LdM1gR7M252L3/fOKTfD601zCAkg1K9NP3I=;
        b=sBVRkQxY1Us6qi7n7uWtfAAAcq98/9zGWLsWdBRrKOugvhCmA7w5QklUapvZK8PZAC
         qxJ7lSn3gy/wrR3FDHN3h0sZVKdy9TZbXj4FFKD97otONSVFH2Tdtvw7H/o5azks7lOI
         dD0ZOZVxdtPFc6wXsz9mlcvuaKtmVxaARReRwDF/yyh/e9ZsMyik9RZjiEqIjLn5FAlf
         AjQakj0sEhPPzX5Wyok1PJh0oup4wZuTKRzAiy5JFd6jyu6PQUiObd5hGDiouFLlKrN7
         1FFzCkww3ayB57a0DmOrmzIJ01r+bO8oU9ERVoD2PcnXD7BQ3ICMEy4Prke4RDcb/911
         zEMA==
X-Gm-Message-State: AOJu0Yyex57qOuKBUboAV9v/D8bHh42x90Zrcdxz8Ikhf3fnX8WIpwST
	F6WjbA0b95KRqs4EpMMqlAyTGSSxfT4N5in7BJF/NT+eMI2kd4b6Im3ICr+sU9OuLYeNjtX0F+/
	Qk7+DSa/+03hC6JS3AiaOPDlXEsX9gv9b0BA+ocLi0iZHqZ9V0S4I7d1BprNNBXxlGETzWPrLzd
	wp
X-Gm-Gg: Acq92OHLYH2RpiRnnI1zSwQ6y4R650Fk9fEVtyzCzLw1TKDqP2JndzrNc08LGXz4xjt
	xcXLtieqpRATOSDrw1fbOShLmEP+KaXLkEpEeGA6jYpCRwMdznY221k206YzPnr2VLvqSeWjzEp
	3uFMBmtxgHsa5nw8Br+y6dUQQl8dBbOvWAoUONTXS3CG60YT09exM5YrNn9ENQvjUaW9g8eleo5
	1t8ahHk9r6TIhhRhV3N9i3qhgYCImDH7TRdRIdb/c4n9snMnSkDntaxi9umN/R9pT9mYzLjgQuf
	SWF5hzJ0bQgyksVynS+Q2w3z3bq/kj74Sj3doBE6kyJm7znzb0sD0J9lp/SGsHvxXglIthWhzXm
	ZZ8+uFvo0yvh7xPjAAiSqby7aAQk4Kxuwht+2xL3/h6GBZd65I26lNwAqHxtK0nwW+U+xjyJawR
	XOGuwmI3i9B9gLM2U=
X-Received: by 2002:a05:690c:6:b0:7bf:1433:8f92 with SMTP id 00721157ae682-7d20b278cccmr7101267b3.7.1779325790520;
        Wed, 20 May 2026 18:09:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6:b0:7bf:1433:8f92 with SMTP id 00721157ae682-7d20b278cccmr7101067b3.7.1779325789988;
        Wed, 20 May 2026 18:09:49 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:48 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH v2 0/4] phy: qcom: qmp-combo fixes + x1-dell-thena DT maintenance
Date: Wed, 20 May 2026 18:09:31 -0700
Message-ID: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OqVMh72NXnG4fRVEtE2O22i0r5qcXeYN
X-Proofpoint-ORIG-GUID: OqVMh72NXnG4fRVEtE2O22i0r5qcXeYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfXyap1ujvb2iOj
 IZoV98OJP0DwOQFoXYPrvLcgt1jHzm2eljGchGUVE6xeUOzklNz4XOKohB2F8Pn3UeBFisILeGk
 CTGI844B7DDZRl4T9/UvLu9HTwbxNWPvA6u2gbHxQP4Kf2uhb81p/MSH9PXkyUV0VH5vWBdPhBz
 lAojhpuwGpSlW0Og6M26dp9yTpjo5lKm+YnBEtmvub6kMmxsW9Epdv2IZPe4dI1FJhwZ9MoIam8
 qJu+2q+fW5Y+sMBQVzGik3ZH5qPcOX5VSFqy/BPMjCM+XHd9M7hifXdUzeIN0KuYH/a/Ra3PrNg
 Mgllb7/Q9E2lHukHGogVgrvCnk0UgAMFHlpaO3PhV+0LleHNLusiYQNOzOQeavcH7yEanb/K2n9
 ds87nWKyEb6PBs5uYJmJ5fBEm8d9v4lbAe6C2HwHhV8JZghEDxEtIXFlVcaPzuId+1qKXxuWZ24
 IjDmHK3XUyY9Uek/jKg==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e5b5f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uA_aelndhFUrj06f5w0A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2C7659D896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Four patches:

  * Two pre-existing bug fixes in phy-qcom-qmp-combo that are reachable
    today on any board which registers a usb_role_switch on this PHY,
    and will become reachable on more X1E boards as their Type-C
    support matures (patches 1-2).

  * Two dell-thena DT maintenance items: one mirrors a regulator
    always-on change Hovold applied to the rest of the X1E80100
    family but that dell-thena missed, and one bumps the linux,cma
    reserved-memory pool so the camera pipeline can actually
    allocate buffers alongside a normal desktop (patches 3-4).

== Changes since v1 ==

  * Rebased from v7.1-rc4 onto linux-next (next-20260520). v1 did not
    apply on top of commit f546912bcac6 ("phy: qcom: qmp-combo: Move
    pipe_clk on/off to common"), which landed in phy/next after
    v7.1-rc4; patch 1's hunk context is adjusted for that refactor.
    No functional change to any patch.

v1: https://lore.kernel.org/linux-arm-msm/20260521003615.1260844-1-mike.scott@oss.qualcomm.com/

== phy-qcom-qmp-combo fixes (patches 1-2) ==

Both bugs were found by exercising the typec_mux + role-switch code
paths on Dell Latitude 7455 (X1E80100, dell-thena). In mainline
today the bugs are reachable on x1e001de-devkit, which registers a
usb_role_switch on one USB-C port; they would also fire on any
future board that opts into the same DT pattern.

Patch 1: qmp_combo_usb_power_off() / qmp_combo_usb_exit() can be
re-entered as ->exit from an external consumer (dwc3 phy_exit during
driver unbind) after this device's backing devm resources have
already been released along a separate teardown chain. The
dereference of qmp->pcs (whose ioremap has been freed) then oopses
with a level-3 translation fault. The patch adds a usb_init_count
guard so the re-entry is a no-op. The proper long-term fix is a
teardown-ordering rework so the QMP PHY outlives any consumer that
may still call its phy_ops; until then, this guard prevents the
oops.

Patch 2: qmp_combo_typec_mux_set() updates the cached qmpphy_mode
unconditionally, but only reprograms hardware when init_count is
non-zero. So a typec_mux_set arriving before phy_init updates the
cache without programming hardware; subsequent calls then see a
"match" against the cached mode and bail out early, leaving the
lane mux in whatever state it powered up in. The patch tracks
separately whether the cache has been committed to hardware, so
the fast-path bail only happens when the cache truly reflects the
hardware.

== DT maintenance (patches 3-4) ==

Patch 3 marks vreg_l12b_1p2 and vreg_l15b_1p8 always-on. Hovold did
this for every other X1E80100 board in March 2025; dell-thena landed
four months later (commit e7733b42111c) and missed the change, which
leaves the kernel free to disable those LDOs even though several
board-level fixed regulators have no described vin-supply link back
to them.

Patch 4 raises linux,cma from 128 MiB to 256 MiB. The 128 MiB pool
is too small to support libcamera's buffer set in parallel with the
normal desktop: msm DRM framebuffers, qcom_iris codec buffers, and
qcom_camss VFE pre-allocations occupy ~100 MiB at GNOME idle,
leaving ~25 MiB free. libcamera's "simple" pipeline asks for four
8.35 MiB ABGR8888 frames (32 MiB total) and the fourth allocation
fails with "dma-heap allocation failure". At 256 MiB, ~150 MiB is
free at idle -- comfortable headroom.

Note for other X1E maintainers: every other X1E80100 / X1E78100 /
X1P42100 board in mainline is still on the 128 MiB default, and
several of them carry camera nodes (Dell XPS 13 9345, Medion
Sprchrgd-14, ASUS Zenbook A14, Microsoft Romulus, Microsoft Denali,
Lenovo ThinkBook 16). Those boards are likely to hit the same
allocation failure once libcamera enablement lands on them, and
should probably take a similar bump. I limited this patch to
dell-thena because I do not have the other boards on hand to
verify the resulting CmaFree numbers under a real workload --
applying the same change blindly across boards I cannot test would
just shift the guesswork.

== Patch summary ==

  1/4  phy: qcom: qmp-combo: skip USB power_off/exit after device
       teardown
  2/4  phy: qcom: qmp-combo: track whether the cached typec_mux mode
       was committed to hardware
  3/4  arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
  4/4  arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB

== Testing ==

Hardware: Dell Latitude 7455 (X1E80100), running Ubuntu 26.04.

Test kernel: a local build of Ubuntu's 7.0.0-15-generic source with
this series applied on top. The series in this submission is rebased
onto linux-next (next-20260520) so that it applies cleanly on top of
Val Packett's recent qmp-combo refactor (commit f546912bcac6, "phy:
qcom: qmp-combo: Move pipe_clk on/off to common"), which is queued in
phy/next and reaches mainline at the next merge window.

  - Without this series:
    * Writing "none" to a manually-bound usb_role_switch reliably
      oopses the kernel. vmcore captured via kdump-tools; crash(1)
      analysis confirms qmp->pcs UAF in qmp_combo_usb_power_off,
      reached via dwc3_remove -> dwc3_phy_exit -> phy_exit ->
      qmp_combo_usb_exit.
    * Without patch 2, the first typec_mux_set arriving before
      phy_init updates the cache but not the hardware; the next
      call hits "same qmpphy mode, bail out" and the lane mux
      stays in its default configuration.
    * libcamera-mediated camera apps (gnome-snapshot, etc.) fail
      to start with "dma-heap allocation failure for frame-3".

  - With this series:
    * Role-switch teardown no longer oopses (patch 1's guard).
    * QMP PHY is reprogrammed on first altmode notification after
      phy_init (patch 2's committed-state tracking).
    * CmaFree at GNOME idle is ~150 MiB (was ~25 MiB).
    * gnome-snapshot opens with a live preview from the OV02E10
      sensor.

Patches 1-2 were exercised by manually wiring up a usb_role_switch
on dell-thena and driving the role-switch path; the DT change that
makes that wiring permanent is not part of this series.

A personal note: it has been a while since I last sent patches
upstream -- as you may have gathered from v1 being based on v7.1-rc4
rather than linux-next. Apologies for the extra round-trip; if I have
missed any other recent process changes, corrections are welcome.

Michael Scott (4):
  phy: qcom: qmp-combo: skip USB power_off/exit after device teardown
  phy: qcom: qmp-combo: track whether the cached typec_mux mode was
    committed to hardware
  arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
  arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB

 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi |  4 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   | 47 +++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 3 deletions(-)

base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0

--
2.53.0


