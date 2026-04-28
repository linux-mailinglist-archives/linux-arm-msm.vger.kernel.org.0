Return-Path: <linux-arm-msm+bounces-104958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFYyJXCU8GldVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:05:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008C483486
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0252730BD49F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E774B40FD86;
	Tue, 28 Apr 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9giBUEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EC40FD80;
	Tue, 28 Apr 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372961; cv=none; b=o2r+6LWqqqgcb9s0E4zRvhJyO/iU+hC30f0AOPBpYRazoNxlr3163Vd7xBMcZASoZUysI5BITLHDRYMVRcHkHMmfumHW2w+8MGb8gRoHKgK+po4iGcYSiq0yrZSfNC7gzw947SjLjBRfcbZ1LPSm65Yjq/r0TMqNjl+sqLHtdts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372961; c=relaxed/simple;
	bh=twOlHH7KrcmO14xpMu62cZV8X4eA4YZRUPc+K8pXitY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLodn4ub8+3DN6ECNshYOWOEso7HxNQ7chRblygfyOk6OX2jeRDxpWIAc96nuQ17y0PdK7lWp+X5LPPmeF1dKt9Tlgf/5rYtdF8ElmGguTuzEk+caBSdkDTSD81Ezfb12VNrtvQLngfc03LSrlaLrYl7hWN/Sz9GNxnA+I+qKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9giBUEQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4B3C2BCAF;
	Tue, 28 Apr 2026 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372961;
	bh=twOlHH7KrcmO14xpMu62cZV8X4eA4YZRUPc+K8pXitY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n9giBUEQgSc+6HD5OZub/GfOa57U3xAE2Pdv5HtyzZFRVD/9ZHbcgipmTK1F45QWn
	 WM3AtT2nI+7jgx26UYW89+bnxrbhTe9dbuVdtHrZus0xcF4sAJQ1gem1y0k8ce/RgI
	 bG6+ecj302G49b3orT/ickvts4ZqLC2MzpesfQcHWBnVDNsSs1/UULnzBiJYbA3vgF
	 gMww6Xpr4lYfiAcjNRUCd3hNlmy7kE2biEuBNilaOIokvyEy3bwzQ1pCL5k5p7F/Jk
	 igdz7io/aDULguQ75bXrtSqzt4IUpw6dwo6xeJGe/NH3AOKRtfTGfDHK+56vyoRP8t
	 3mgSSVNgVeAVg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	jirislaby@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] serial: qcom-geni: Fix RTS behavior with flow control
Date: Tue, 28 Apr 2026 06:40:59 -0400
Message-ID: <20260428104133.2858589-48-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1008C483486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104958-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,linuxfoundation.org:email]

From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>

[ Upstream commit 0b1837c04d2335ec50b9a55b0282dcde7bc12439 ]

When userspace enables flow control (CRTSCTS), the driver
deasserts RTS even when the receive buffer has space. This prevents the
peer device from transmitting, causing communication to stall.

The root cause is that the driver unconditionally uses manual RTS control
regardless of flow control mode. When CRTSCTS is set, the hardware should
automatically manage RTS based on buffer status, but the driver overrides
this by setting manual control.

Fix this by introducing port->manual_flow flag. In set_termios(), disable
manual flow when CRTSCTS is set. In set_mctrl(), only assert
SE_UART_MANUAL_RFR when manual_flow is active. Verified by enabling and
disabling hardware flow control with stty.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Link: https://patch.msgid.link/20260310104155.339010-1-anup.kulkarni@oss.qualcomm.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to complete the full analysis.

## Analysis

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject line parse**
- Record: [serial: qcom-geni:] [fix] [RTS behavior with hardware flow
  control (CRTSCTS)]

**Step 1.2: Tag inventory**
- Record: Signed-off-by: Anup Kulkarni (author, @oss.qualcomm.com),
  Signed-off-by: Greg KH (applied to tty tree). Link: patch.msgid.link
  URL. NO Fixes: tag, NO Cc: stable, NO Reported-by, NO Tested-by, NO
  Reviewed-by, NO Acked-by. Only v1 of patch, no reviewer replies on
  thread.

**Step 1.3: Commit body analysis**
- Record: Bug: "driver deasserts RTS even when the receive buffer has
  space" when CRTSCTS is enabled, causing "communication to stall". Root
  cause: driver unconditionally uses manual RTS control via
  `UART_MANUAL_RFR_EN`, which overrides hardware's auto-flow control. No
  stack trace or reproducer. Author verified fix "by enabling and
  disabling hardware flow control with stty".

**Step 1.4: Hidden bug fix detection**
- Record: Not hidden - commit message explicitly says "Fix RTS behavior"
  and describes the bug clearly.

### PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Record: Single file `drivers/tty/serial/qcom_geni_serial.c`. +15/-4
  lines. Modifies `qcom_geni_serial_set_mctrl()` (1 line guard added)
  and `qcom_geni_serial_set_termios()` (restructured CRTSCTS branch).
  Adds `bool manual_flow` to `struct qcom_geni_serial_port`. Scope:
  surgical single-driver fix.

**Step 2.2: Code flow change**
- Record:
  - set_mctrl BEFORE: `if (!(mctrl & TIOCM_RTS) && !uport->suspended)` →
    enable manual RFR (`UART_MANUAL_RFR_EN | UART_RFR_NOT_READY`) then
    unconditionally write.
  - set_mctrl AFTER: Only enables manual RFR when `port->manual_flow` is
    true AND RTS not set AND not suspended.
  - set_termios BEFORE: Only toggles `UART_CTS_MASK` bit in TX config.
  - set_termios AFTER: Also sets `port->manual_flow = false` when
    CRTSCTS set (HW manages), `true` otherwise.

**Step 2.3: Bug mechanism**
- Record: Category (g) Logic/correctness fix. The mechanism: when
  CRTSCTS is enabled, hardware should automatically drive RTS based on
  RX FIFO fullness. But any call to `set_mctrl` with `!TIOCM_RTS` (which
  happens during resume: `ops->set_mctrl(uport, 0)` at
  serial_core.c:2421, at B0 baud transitions serial_core.c:1685, or on
  ioctl TIOCMBIC) would cause the driver to write `UART_MANUAL_RFR_EN |
  UART_RFR_NOT_READY`, forcing manual RTS deassertion and preventing the
  peer from transmitting.

**Step 2.4: Fix quality**
- Record: Simple, easy to verify by reading. Logic is correct: when
  hardware flow control is enabled, never override with manual mode. The
  `manual_flow` flag is BSS-initialized to `false`, which matches
  "hardware controls RTS" default. Small regression risk: before the
  first `set_termios` call, any `set_mctrl(!TIOCM_RTS)` path now writes
  0 instead of enabling manual mode; this is arguably more correct but
  changes initial state. No public API changes, no lock changes.

### PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame the changed lines**
- Record: The manual RFR logic in `set_mctrl` was added in
  `8a8a66a1a18a1` (v4.19, July 2018) "tty: serial: qcom_geni_serial: Add
  support for flow control". The early-return guard
  `!uart_cts_enabled(uport)` was removed in `e8a6ca808c5ed` (v5.0) "tty:
  serial: qcom_geni_serial: Allow mctrl when flow control is disabled" —
  which actually made the bug more exposed (before that change, the
  manual-mode code path was unreachable when CRTSCTS was off, but still
  buggy when on).

**Step 3.2: Follow the Fixes: tag**
- Record: No Fixes: tag in this commit. Most likely should reference
  `8a8a66a1a18a1` (v4.19) as the origin — the bug has existed since flow
  control support was added to this driver.

**Step 3.3: File history for related changes**
- Record: Recent related fix `947cc4ecc06cb` "serial: qcom-geni: fix
  soft lockup on sw flow control and suspend" (July 2024) was tagged
  `Cc: stable # 4.17` — shows that flow-control-related bugs in this
  driver have been deemed stable-worthy. Also `23f5f5debcaac` "serial:
  qcom-geni: fix shutdown race" exists. No overlap/conflict with this
  fix.

**Step 3.4: Author commits**
- Record: `git log --author="Anup Kulkarni"` shows only 1 other commit
  (`4fcc287f3c692` "serial: qcom-geni: Enable support for half-duplex
  mode"). Newer contributor but from @oss.qualcomm.com - this is the
  vendor (Qualcomm) whose hardware this driver supports. Patch went
  through Greg KH's tty tree.

**Step 3.5: Dependencies**
- Record: No dependencies found. The fix is self-contained and
  references only symbols that exist since the original flow control
  support commit (v4.19).

### PHASE 4: MAILING LIST RESEARCH

**Step 4.1: b4 dig**
- Record: Single revision (v1) at https://patch.msgid.link/2026031010415
  5.339010-1-anup.kulkarni@oss.qualcomm.com. Thread mbox retrieved. Only
  one message in thread - just the patch itself, no replies, no NAK, no
  explicit stable nomination.

**Step 4.2: Who reviewed**
- Record: `b4 dig -w` shows to/cc: gregkh, jirislaby (tty maintainers),
  praveen.talari/viken.dadhaniya/zongjian/jseerapu (Qualcomm),
  bryan.odonoghue (linaro), krzk (Krzysztof Kozlowski), linux-serial,
  linux-arm-msm, linux-kernel. Appropriate maintainers were CC'd but no
  one publicly replied on lore before Greg applied it.

**Step 4.3: Bug report search**
- Record: No Reported-by or bug link in commit. Web search did not
  surface a specific user report for this stall.

**Step 4.4: Related patches/series**
- Record: `b4 dig -a` shows v1 only; standalone single-patch submission.

**Step 4.5: Stable list history**
- Record: Nothing found discussing this specific fix on stable@.

### PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Functions modified**
- Record: `qcom_geni_serial_set_mctrl`, `qcom_geni_serial_set_termios`.

**Step 5.2: Callers**
- Record: Both are `uart_ops` callbacks registered in
  `qcom_geni_console_pops`/`qcom_geni_uart_pops`. Called indirectly
  through `port->ops->set_mctrl(...)` and `uport->ops->set_termios(...)`
  from `drivers/tty/serial/serial_core.c`. Key caller sites for
  `set_mctrl`: startup/shutdown, suspend/resume (lines 2333/2421), RS485
  disable path (1483), B0 transitions (1685/1692), throttle/unthrottle
  (with AUTORTS — not used here). This makes the bug reachable on every
  resume and on any baud change to/from B0 when CRTSCTS is active — very
  common paths.

**Step 5.3: Callees**
- Record: set_mctrl only calls `writel(...)` to SE_UART_MANUAL_RFR. No
  locking, no allocation. Minimal side effects.

**Step 5.4: Call chain reachability**
- Record: Reachable from any userspace UART open with CRTSCTS, stty
  changes, system suspend/resume, and B0 transitions. Definitely user-
  reachable, exercised on every device with hardware flow control
  enabled.

**Step 5.5: Similar patterns**
- Record: Verified driver does NOT advertise `UPSTAT_AUTORTS` (no hits
  for that flag) - so auto-RTS tty layer logic doesn't apply; the driver
  relies entirely on hardware register-level RFR management when CRTSCTS
  is on. This confirms the issue: the driver's set_mctrl was silently
  overriding hardware-managed RTS.

### PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Does buggy code exist in stable?**
- Record: Verified the identical buggy `set_mctrl` body exists in stable
  6.17.y, 6.12.y, 6.6.y, 6.1.y, and 5.15.y. The same CRTSCTS branch `if
  (termios->c_cflag & CRTSCTS) tx_trans_cfg &= ~UART_CTS_MASK; else
  tx_trans_cfg |= UART_CTS_MASK;` is present in all of them. Bug has
  existed since v4.19 → affects ALL currently supported stable trees.

**Step 6.2: Backport complications**
- Record: Low complexity backport. The struct has `bool cts_rts_swap` in
  every stable branch (verified). Both hunks context-match. Minor
  difference: 5.15 uses legacy `to_dev_port(uport, uport)` macro
  (irrelevant to the hunk). Expected: clean apply or minor context
  rewrap.

**Step 6.3: Related fixes already in stable**
- Record: `947cc4ecc06cb` (flow control soft lockup fix) is already in
  stable and addresses a different flow-control issue. No conflict with
  this fix.

### PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem criticality**
- Record: Subsystem: `drivers/tty/serial/` — Qualcomm GENI serial
  driver. Criticality: PERIPHERAL (driver-specific) but IMPORTANT for
  the affected platforms (Qualcomm SoCs used in Chromebooks, embedded
  devices, Android phones, etc., where hardware flow control to
  Bluetooth/GPS/modem peripherals is critical).

**Step 7.2: Subsystem activity**
- Record: Driver is actively maintained, with regular fixes going in.
  This suggests real users.

### PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Who is affected**
- Record: Users of Qualcomm SoCs running Linux that use UART with
  `CRTSCTS` enabled — commonly Bluetooth HCI over UART, GPS modules,
  baseband modems. Affects Android devices, Chromebooks, embedded
  Qualcomm platforms.

**Step 8.2: Trigger conditions**
- Record: Trigger is any invocation of set_mctrl with RTS cleared while
  CRTSCTS is active. Concrete triggers:
  1. System suspend/resume cycle (very common on mobile/laptop)
  2. B0 baud transitions (modem hangup)
  3. Any direct ioctl(TIOCMBIC, &TIOCM_RTS)
  Unprivileged? Root access to the tty device is typical for the
trigger.

**Step 8.3: Failure mode severity**
- Record: Functional failure — communication stalls because RTS is stuck
  deasserted and peer stops transmitting. No kernel crash, no data
  corruption, no security hole. Severity: MEDIUM-HIGH — "communication
  stall" is a real stability issue for devices depending on this UART
  (e.g., Bluetooth dropouts, serial session lockups). Not a crash, but
  noticeable and disruptive.

**Step 8.4: Risk-benefit**
- Record:
  - Benefit: MEDIUM — fixes a real functional bug on actively-used
    hardware (Qualcomm platforms) with a clear reproduction path,
    especially after resume.
  - Risk: LOW — 15 lines, single file, trivial to audit, no
    locking/memory changes, no API changes. The `manual_flow` field
    defaults to `false` which aligns with hardware-managed mode (safe
    default).
  - Ratio: Favorable for backport. Very low risk of regression for
    benefit of fixing real-world stalls.

### PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence**
- FOR: Real user-visible bug clearly described; present since v4.19 in
  all stable trees; small surgical fix; touches only a driver callback;
  correct logical direction (CRTSCTS means HW controls, manual mode
  should be off); fix verified by author with stty; applies cleanly; no
  API/feature additions; author is Qualcomm, i.e., the hardware vendor.
- AGAINST: No Fixes: tag; no Cc: stable; no reviewer Ack/Reviewed-by; no
  user bug report linked; single-revision patch with no lore discussion;
  reachable in common paths but severity is functional (not
  crash/security/corruption).
- UNRESOLVED: Could not directly observe the reproduction trace (no
  stack trace in commit).

**Step 9.2: Stable rules checklist**
1. Obviously correct? YES — straightforward logic; author tested.
2. Fixes a real bug? YES — stated reproducer via stty.
3. Important? MEDIUM — functional stall on Qualcomm platforms using flow
   control (BT/GPS/modem), not a crash/security/corruption.
4. Small and contained? YES — 15 lines, 1 file, 1 driver.
5. No new features/APIs? YES — internal bool field only.
6. Applies to stable? YES — verified code exists unchanged in 5.15.y
   through 6.17.y.

**Step 9.3: Exception categories**
- Not strictly an exception, but closely aligned with a hardware
  workaround in a mature driver.

**Step 9.4: Decision**
This is a real, reproducible bug fix in a driver used on widely-deployed
Qualcomm hardware (Chromebooks, Android, embedded). The fix is tiny,
purely internal, doesn't introduce APIs or affect other subsystems, and
the logic is clearly correct (hardware flow control should not be
overridden by manual RTS assertion). The bug is reachable in common
operational paths (resume, B0 transitions). Backport risk is minimal.

## Verification

- [Phase 1] Parsed tags from commit: only Signed-off-by (author + Greg
  KH) and Link. No Fixes:, no Cc: stable, no Reported-by, no Reviewed-
  by/Acked-by.
- [Phase 2] Diff analysis confirmed on the actual patch text: 1-line
  guard in set_mctrl, 2 branches expanded to set `manual_flow`, 1 new
  struct field.
- [Phase 3] `git log` on file showed history; `git show 8a8a66a1a18a1`
  and `git show e8a6ca808c5ed` confirmed the code origin (v4.19 via git
  describe) and the removal of the CTS-enabled guard (v5.0).
- [Phase 3] `git describe --contains 8a8a66a1a18a1` →
  v4.19-rc1~102^2~33; `e8a6ca808c5ed` → v5.0-rc4~20^2~1. Bug has been
  present since v4.19.
- [Phase 3] `git log --author="Anup Kulkarni"` → 2 commits total (this
  one plus half-duplex mode). Relatively new contributor, Qualcomm
  vendor author.
- [Phase 3] `git log --grep="serial.*qcom.*flow"` → confirmed
  `947cc4ecc06cb` (previous flow control fix, tagged `Cc: stable #
  4.17`) is a precedent.
- [Phase 4] `b4 dig -c 0b1837c04d233` → found single lore thread, v1
  only, single message, no replies.
- [Phase 4] `b4 dig -c 0b1837c04d233 -w` → recipients confirmed: gregkh,
  jirislaby, Qualcomm team, bryan.odonoghue, krzk, linux-serial, linux-
  arm-msm, linux-kernel.
- [Phase 4] `b4 dig -c 0b1837c04d233 -a` → only v1 exists; went direct
  to Greg's tree.
- [Phase 4] Saved thread to /tmp/qcom_geni_thread.mbox; read contents -
  confirmed no replies, no reviewer feedback.
- [Phase 5] Grepped `UPSTAT_AUTORTS|UPSTAT_AUTOCTS` in
  qcom_geni_serial.c → no matches. Driver does NOT use UPSTAT_AUTORTS,
  so throttle/unthrottle don't clear RTS through set_mctrl path.
- [Phase 5] Grepped `SE_UART_MANUAL_RFR|UART_MANUAL_RFR_EN` → only 2
  writers: `qcom_geni_set_rs485_mode()` (only when RS485 enabled) and
  `qcom_geni_serial_set_mctrl()` (the fixed function). No other paths
  touch this register.
- [Phase 5] Read `serial_core.c:2320-2451` → confirmed
  `ops->set_mctrl(uport, 0)` is called at resume (2421) with
  `uport->suspended` already 0, directly triggering the bug path when
  CRTSCTS is active.
- [Phase 5] Read `serial_core.c:1680-1694` → confirmed B0 transition
  logic can cause set_mctrl with !TIOCM_RTS while CRTSCTS is active.
- [Phase 6] `git show stable/linux-
  {6.17,6.12,6.6,6.1,5.15}.y:drivers/tty/serial/qcom_geni_serial.c` →
  verified identical buggy `set_mctrl` body and identical CRTSCTS
  handling in set_termios in all five stable trees. Struct has
  `cts_rts_swap` in all of them, so the `manual_flow` addition will fit
  cleanly.
- [Phase 8] Failure mode: communication stall (peer cannot transmit). No
  crash. Severity: MEDIUM-HIGH functional. Trigger: common (resume, B0).
- UNVERIFIED: Could not obtain a literal crash/stall reproducer from
  commit message; the author's claim of verification via stty is the
  only direct test evidence. Did not independently reproduce the bug.

The fix is small, narrowly scoped, logically sound, and addresses a real
functional bug that is triggered on common paths (resume, B0) in a
driver used on widely-deployed hardware. It meets the stable kernel
rules.

**YES**

 drivers/tty/serial/qcom_geni_serial.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e6b0a55f0cfb2..9854bb2406e3f 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -146,6 +146,7 @@ struct qcom_geni_serial_port {
 	int wakeup_irq;
 	bool rx_tx_swap;
 	bool cts_rts_swap;
+	bool manual_flow;
 
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
@@ -250,7 +251,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (mctrl & TIOCM_LOOP)
 		port->loopback = RX_TX_CTS_RTS_SORTED;
 
-	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
+	if (port->manual_flow && !(mctrl & TIOCM_RTS) && !uport->suspended)
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
 }
@@ -1401,11 +1402,21 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	else
 		stop_bit_len = TX_STOP_BIT_LEN_1;
 
-	/* flow control, clear the CTS_MASK bit if using flow control. */
-	if (termios->c_cflag & CRTSCTS)
+	/* Configure flow control based on CRTSCTS flag.
+	 * When CRTSCTS is set, use HW/auto flow control mode, where HW
+	 * controls the RTS/CTS pin based FIFO state.
+	 * When CRTSCTS is clear, the CTS pin value is ignored for TX
+	 * path and RTS pin can be set/cleared using registers, for RX
+	 * path.
+	 */
+
+	if (termios->c_cflag & CRTSCTS) {
 		tx_trans_cfg &= ~UART_CTS_MASK;
-	else
+		port->manual_flow = false;
+	} else {
 		tx_trans_cfg |= UART_CTS_MASK;
+		port->manual_flow = true;
+	}
 
 	if (baud) {
 		uart_update_timeout(uport, termios->c_cflag, baud);
-- 
2.53.0


