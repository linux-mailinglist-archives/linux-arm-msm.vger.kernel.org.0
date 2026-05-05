Return-Path: <linux-arm-msm+bounces-105948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GNxN8ni+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2C4CD7EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27EFF30B917A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D9B426ED1;
	Tue,  5 May 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfpLIXgl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQoTDrOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AB7426D3F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983895; cv=none; b=L3gIxqjoeygtgu6x7cKvNNOZpv1CQbRhFqgxbPwJihnaVAxVP9f+AYqUcDG69/b+y3U+5wNVYg41uVoJs6b+Cb+1hP5aF4JlVmXANapTmVMXEk+30jMmduY/vrsxyNdR9WNMXHJhZY0B17pWXPnXTje+glQwyeFqaoz6fzti4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983895; c=relaxed/simple;
	bh=LH5eI4O7oMmhHpNa4d3YP/b842GVrQFgBmayb5QmmyE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iTU/sAO+wvTXxEipdzh3FwH2WKv4S6RbUlBdHqHYCQFq9I9rQJ7jd9E3/d90J8yzpx/Ggzlxo57UeKNJ2DkWQSuwpIUUjJTWqg6l3N8hZMqkGpPg8NXfYVF6XUWyxySwfu263YpZRseQItUil8h12TbhsZt91IdEpl75P6WgG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfpLIXgl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQoTDrOs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456HH3t331125
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zM9ocX8JV1Cv5KtYnJWxIR
	FrysMjsRiAcB0T3nYcVGA=; b=jfpLIXglJKaJ8OuOjhw51F2WyyUpJkJWM9Kvb2
	O/+ud7JRATo/qtWtNQpz34sRpyifkQjME0B+S0jSvzMtSvIhZVemUKcZe+g5n34L
	5QpP+OG+ysHwtK3a8BjM+Gd25ocJD05gcvUyeV/z82/hkt4HhmDjsU+eoPWGgnrZ
	IUXCO0XLEFgSVKCPDsJ7O7X+RQuwTKWqmtGMN/q+wyxUe4RQHIUvN//2hvr/NCkq
	o64jCIj7ITZ53uwCglWQq8w9r5BGBWwILGNVdgeZWxDuAS2fhhTB8FUwWjK9sAIb
	3thq0PDAjGDCuj08vvCLkLwK0DwuZn5ZHJKcYat+wXjyg3bg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1cdg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:24:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-364c6c8e1b4so1908933a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983892; x=1778588692; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zM9ocX8JV1Cv5KtYnJWxIRFrysMjsRiAcB0T3nYcVGA=;
        b=JQoTDrOsFZKN62JX5sKTMKb6QLAxm4gVh/fds/+kD01sS80wKSonrhRpuZqaiItLtk
         pZ66MiP+INuanQgVJE1u3k7box1jx7dvW1Z6jiF2qbMXVyBdkysRXt9c1uDnVmpFreSN
         MRmyuNgp220+4CWFyeVZC7CqX1Mn9g+ag8s9wCbqqlcols7S8m5aQkd4cqnJs/fFdu7q
         FnFcpJafKsLA8yRpelLLDTruskg/nUP5jZ9aU98GqzZQS+nDPD9qgJJrOUDh/6nVPuIA
         IH3BBCZimtL5aWVDvV+TnzDZixrmtE4MJjxQ/xvEouVq4/o0Xo6UVXW/B8woc2A4Jg4h
         Nsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983892; x=1778588692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM9ocX8JV1Cv5KtYnJWxIRFrysMjsRiAcB0T3nYcVGA=;
        b=V0QAsFCMpTOsEw44fl5VlNjzGZnP67rVS1dxnZfo6tLCD7zWsChsjOk6RoNxelDGej
         CqsDWa6QypqKMcLBA4MmfWc/reio6pmKpYCfuxi7SlWqJva7/EP+c3O29UoKNVvsUc4r
         9b2USupYLxmImNpi0+VgA091aWVYnNdcIYm81u21LjHiL9qUlJIDo92lMzjzoUrP+lHf
         zX6USJlSlVsHjTYsiauINELlKmP6u3y4gWZTI0ucTikegVK47kDB0DGsbg071bts5kWv
         BBpqzo/mixergYpljPz9SLot2zUBYfslApnwNt8zEGas3Ax2izLF2xEUW/A9GnWZS52B
         ubIw==
X-Gm-Message-State: AOJu0YwmsqGVPv3cLHIlQ+aAhoiXuoVVXnpnHnEeb//RShDE+PAAks47
	nfWxn25TPILDTs2FhgUyd+mfwcntNy6qrxICcKejNQdZGlSF5IkYByFa4PcODR+o3dRPiU7ZR5R
	/xDjdhNi0HYJ4C6NXkHyblIZxjayKv4W/P/lZbZ+3OELA5wGSeorXR+Xgks9fMicCMRWr
X-Gm-Gg: AeBDiescoiL7NtG3GS0MPDk1WWlNvqgi+LZd7BNYjpHM9I1MGYBmZgAnXI1ltAF6q6h
	6p7GNIR2g42qwTFIFNwOo4vTTTjKBx+oAWaQDBlaed/es3mCuYkXPAxmfgAyO3ot1mcW4+MYtOB
	xi+CM9DZ/23lEGYalApu139rk5kbivoD7XRBLGlK0J0VACy6wbdwEwatY26AUuTzu1ZiF+hDb3e
	jRpvS+Hw7Vy7wemM8Sd8wm5n828u29TbNc1D9EqQA0i+bYeX/xJoI6ir19fFf/Cc5b6qMHo9yvE
	IO6t13hXKcmIo3QuPeTIajLqW83UV8qnPj9ZRkMj0Lggsuuds0KhJxPq3bUlcmIqsqHs5FTPTOA
	DRgkKLaM5LuyfvGojVjMpjqCwMfb3b6CzvO0AbsCsYS8A57Y8eCZFkluzgkWoHZA=
X-Received: by 2002:a17:90b:52:b0:362:bac0:1f64 with SMTP id 98e67ed59e1d1-3650ce6a50emr7493690a91.5.1777983892318;
        Tue, 05 May 2026 05:24:52 -0700 (PDT)
X-Received: by 2002:a17:90b:52:b0:362:bac0:1f64 with SMTP id 98e67ed59e1d1-3650ce6a50emr7493658a91.5.1777983891762;
        Tue, 05 May 2026 05:24:51 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:51 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH 0/8] ras: aest: extend AEST support to Device Tree frontend
Date: Tue, 05 May 2026 17:53:44 +0530
Message-Id: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFHh+WkC/y2Nyw6CMBQFf4V0bUkpFlJijP9hWJRywWukxT4MC
 eHfreBykjlnVuLBIXjSZCtx8EGP1iQoThnRD2VGoNgnJpzxigkmqAIfaJ9MDcEBUB/n2bpAVVl
 z3ksGxSBIWs8OBlz253t7sI/dE3T43f0NB++YkuHQyATeqz3ZZJe9WHDO5LkSVV6XpZS0oAGVc
 RF7a8bbC01ccvXCTnUq13a6knbbvpxIDjDUAAAA
X-Change-ID: 20260505-aest-devicetree-support-a3722d90e1f5
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=6582;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=LH5eI4O7oMmhHpNa4d3YP/b842GVrQFgBmayb5QmmyE=;
 b=3ZE7l0BmQXHEBtvIQQlZMIehnv47J5KCIJABD954SCjxyCAKrp5pFlLpT3ju9yY6mq/9BOf1y
 qBvRhcfbsmpA6NqX2NeH2CJc8ykXczxKk/rMp09Odl012fDqBiyDm0r
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: MjCLaS9a02KTSXb8rjunGAm27r3Wqicr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX/P/VI1ME6vBS
 0NjTiD5i0uJHWoaqteW+8L19DQNOLhMaWk4qnpq/CDhpMSSMbYlPKqN3A2JuiVRFY+HFhW+T+KF
 eHREHxE7a2WNIf6ycru9A0WdRR6eWzNZp/wsz7cola1xR7Es+c39V4jGz1MmyIPLbCAoV2X9c6F
 mN0yZpwVoJ5HvCH21cENegR18hCgOeRRtuw3GTrdH1IzHCeVgBJXAEiGAiLIOdFQMsr8NIkFDON
 9RqNEL9MVP15CbdxZils+p8LFQEmLOMyts3ZR0WttgwAkMXx0Wu+wySlib5hgG04nFGQNW/Np52
 mEwZSnd61HpMrlTd9Nt2wi0p49IhBkFWdec5A+Luu/LawoBOX0m81/77hiArLjK4+fMpTikfqjo
 f+ix4BjcWfqWyW3AFfoWKrBvTk92SS+t2qfyTqRpgDQpq+pM9ibwLka8yT94wzjuZ0iqB7swQ2R
 sj8jk3SxTfQxl/RN63Q==
X-Proofpoint-GUID: MjCLaS9a02KTSXb8rjunGAm27r3Wqicr
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9e195 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=TsauJuHQFXsEoDOOOOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-Rspamd-Queue-Id: 4CB2C4CD7EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105948-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,90d0000:email,arm.com:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series extends Tian Ruidong’s [1] ACPI-based AEST support series
to also cover Device Tree based platforms.

While the existing AEST driver relies on the AEST ACPI table [3], many
embedded Arm platforms use Device Tree exclusively and cannot use the
driver today. This series adds a DT frontend that mirrors the ACPI
implementation and feeds the same core driver, keeping ACPI and DT
paths functionally equivalent.

Along the way, several correctness issues were identified in the core
driver and are fixed in the first part of this series.

The DT frontend is mutually exclusive with ACPI and does not introduce
any DT-specific logic into the core.

How to test with QEMU
--------------------------
Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
virt machine.  To test the DT frontend:

1. Build QEMU:

     git clone https://github.com/winterddd/qemu.git
     cd qemu
     git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
     ./configure --target-list=aarch64-softmmu
     make -j$(nproc)

2. Build the kernel with:

     CONFIG_OF_AEST=y
     CONFIG_AEST=y
     CONFIG_ARM64_RAS_EXTN=y
     CONFIG_RAS=y

3. Add the following DT node to your virt machine DTB.  The QEMU
   fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
   vendor records at 0x090e0000 (SPI 45):

     aest {
         compatible = "arm,aest";
         #address-cells = <2>;
         #size-cells = <2>;
         ranges;
         interrupt-parent = <&gic>;

         /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
         aest-dram0@90d0000 {
             compatible               = "arm,aest-memory";
             arm,interface-type       = <1>;
             arm,group-format         = <0>;
             arm,interface-flags      = <0x22>;
             arm,num-records          = <4>;
             arm,record-impl          = /bits/ 64 <0x0>;
             arm,status-report        = /bits/ 64 <0x0>;
             arm,addr-mode            = /bits/ 64 <0x0>;
             arm,proximity-domain     = <0>;
             reg                      = <0x0 0x090d0000 0x0 0x1000>,
                                        <0x0 0x090d0800 0x0 0x200>,
                                        <0x0 0x090d0e00 0x0 0x100>;
             reg-names                = "errblock", "fault-inject",
                                        "err-group";
             interrupts               = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-names          = "fhi";
         };
	};

4. Boot QEMU with acpi=off:

     ./qemu-system-aarch64 \
       -machine virt,accel=tcg,gic-version=3 \
       -cpu cortex-a57 -m 2G -smp 4 \
       -kernel Image -dtb virt-aest.dtb \
       -append "console=ttyAMA0 acpi=off earlycon" \
       -nographic

5. Verify probe:

     dmesg | grep "DT AEST"
     # Expected: DT AEST: registered 1 AEST error source(s) from DT
     ls /sys/kernel/debug/aest/

6. Inject a CE error via the QEMU MMIO fault injection registers.
   The QEMU device accepts 64-bit accesses only (use devmem with
   the 64-bit width flag):

     devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject

   This triggers QEMU's error_record_inj_write() which sets
   ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
   aest_irq_func() fires, reads the status, and logs:

     AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
     AEST: {1}[Hardware Error]: Error from memory at SRAT proximity domain 0x0

Testing
-------
- Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Tested ACPI path is unaffected: ACPI boot continues to use
  drivers/acpi/arm64/aest.c unchanged.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record 
[3] https://developer.arm.com/documentation/den0085/0200/

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Umang Chheda (8):
      ras: aest: Fix shared processor node handling and error log messages
      ras: aest: Fix CE/UE error counts not incrementing in debugfs
      ras: aest: Skip unimplemented records in debugfs
      ras: aest: Add panic_on_ue module parameter
      dt-bindings: arm: ras: Introduce bindings for ARM AEST
      ras: aest: Add DT frontend for ARM AEST RAS error sources
      arm64: dts: qcom: lemans: add AEST error nodes
      arm64: dts: qcom: monaco: add AEST error nodes

 .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
 drivers/ras/aest/Kconfig                           |  15 +-
 drivers/ras/aest/Makefile                          |   2 +
 drivers/ras/aest/aest-core.c                       |  63 +-
 drivers/ras/aest/aest-of.c                         | 673 +++++++++++++++++++++
 drivers/ras/aest/aest-sysfs.c                      |  27 +-
 drivers/ras/aest/aest.h                            |  15 +-
 include/dt-bindings/arm/aest.h                     |  43 ++
 10 files changed, 1310 insertions(+), 16 deletions(-)
---
base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
change-id: 20260505-aest-devicetree-support-a3722d90e1f5
prerequisite-message-id: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>


