Return-Path: <linux-arm-msm+bounces-105891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMVrLyu/+WkmDAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:58:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529C4CA410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEE4330C40D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E9433F59C;
	Tue,  5 May 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBm91wyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A633F598;
	Tue,  5 May 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974763; cv=none; b=fFdELr/l8poHMDj/1jjGMYAttN3ngTpABK1DwC1ginr7yRgO8SL1AE6fkUVnS8o/k6hdixuyFDpWtB1D/j9ENswBtwl0hHSqKRTt2YOUpOjHI0yqrBG8tMRs7YRXaTrCPh4vIZDPlPzAIA51vmI5/z0jlXHv4ohb9VTMHkG+iZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974763; c=relaxed/simple;
	bh=pOvc9TYEJszw7/FTcwBrL3dR3UNvspd+ks6FQTPLbS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUTxxh8oBBOewg1XANJdOGDPCRWpVHstfeRluNc95eFRVIh56Kt88mEOAUDdj5K6Pv7OkXxi6sI1botsuDWZ7B4XCOsdTC6cO9zaoQjM3GW43fHpiB7IsHWLZVSR96H9LPladtqUZEH8AxghiXQo4Kxnp/9Wy1ERSEbRvi08dfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBm91wyi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806B5C4AF09;
	Tue,  5 May 2026 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974762;
	bh=pOvc9TYEJszw7/FTcwBrL3dR3UNvspd+ks6FQTPLbS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBm91wyidz22QdaFAojZueEb5ywINfB0/y102B8DD2bh2acqa7z/Cfi0Asmg93Nje
	 vyIn53y/M8+6tAWdTys7VQbJ2DzYS8ghSx0MWdipNZtxp96B2d8e0Q+6mAp6lKpHte
	 epr7m0zvmAtTrmOYfEvi4VLEpfE0/e6f6bHKyZkwKMpDZ5xbHukAyY6I3KbfplhIGV
	 l0or45ZDiN0eEKbxVNLNVLAor/X0g9gqwaqV9eSOvqfEwwVVGugrM47759uP5cgXly
	 f97kxvN3CvMdCC6+T3DUGxnOOhsugtGXV5YJiD30qLF8+wCcv/Ol2gq3wN48H/2Kti
	 sZp2sBi9rSIyw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls
Date: Tue,  5 May 2026 05:51:32 -0400
Message-ID: <20260505095149.512052-16-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505095149.512052-1-sashal@kernel.org>
References: <20260505095149.512052-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3529C4CA410
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-105891-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

[ Upstream commit 74c876bfd71b1023029a483d7213015201f62b53 ]

Enable AUX PA sequencing during AUX DAC DAPM events and keep the
AUX-specific RX supplies enabled while the path is active.

Add the missing AUX-related mixer controls, including CLSH PA and
DSD left/right switches, so AUX playback can be routed from userspace.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Link: https://patch.msgid.link/20260420180221.785113-1-ajay.nandam@oss.qualcomm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Decision Summary
This is a small WCD937x codec fix for an existing AUX playback path. The
verified problem is functional: the AUX path has DAPM routing and
SoundWire channel definitions, but lacks required AUX PA
sequencing/supplies and mixer controls needed for userspace routing.
That can result in broken AUX playback on affected Qualcomm WCD937x
systems.

It is not a security/crash/data-corruption fix, and it does add visible
ALSA mixer controls, which is the main stable-policy concern. On
balance, I would backport it to stable trees that already contain the
WCD937x AUX playback code, especially `v6.12+`; it is small, driver-
local, applies cleanly to `v6.12`, and fixes existing hardware
functionality rather than adding a new driver or subsystem.

## Phase Walkthrough

### Phase 1: Commit Message Forensics
Step 1.1 Record: subsystem `ASoC: codecs: wcd937x`; action verb `fix`;
intent is to fix AUX PA sequencing and missing AUX-related mixer
controls.

Step 1.2 Record: tags found: `Signed-off-by: Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com>`, `Link: https://patch.msgid.link/2026042
0180221.785113-1-ajay.nandam@oss.qualcomm.com`, `Signed-off-by: Mark
Brown <broonie@kernel.org>`. No `Fixes:`, `Reported-by:`, `Tested-by:`,
`Reviewed-by:`, or `Cc: stable`.

Step 1.3 Record: message says AUX PA sequencing must be enabled during
AUX DAC DAPM events, AUX-specific RX supplies must stay enabled while
active, and missing CLSH/DSD mixer controls prevent userspace from
routing AUX playback. No crash trace, board name, or kernel version is
stated.

Step 1.4 Record: this is a hidden functional hardware bug fix, not
cleanup. It repairs missing register sequencing and missing routing
controls for an already-present AUX playback path.

### Phase 2: Diff Analysis
Step 2.1 Record: one file, `sound/soc/codecs/wcd937x.c`, `25
insertions`, `1 deletion`. Modified functions/data:
`wcd937x_codec_aux_dac_event()`, `wcd937x_codec_enable_aux_pa()`,
`wcd937x_snd_controls[]`. Scope is single-file, driver-local, surgical.

Step 2.2 Record: `wcd937x_codec_aux_dac_event()` now sets/clears
`WCD937X_AUX_AUXPA` bit 4 with AUX DAC power-up/down.
`wcd937x_codec_enable_aux_pa()` now enables `WCD937X_ANA_RX_SUPPLIES`
bits 6 and 7 after AUX PA power-up and disables them before power-down
completes. `wcd937x_snd_controls[]` gains CLSH/DSD RX SoundWire
switches.

Step 2.3 Record: bug category is hardware sequencing plus
routing/control correctness. The affected path is normal AUX playback,
not an error path, race, memory safety issue, or refcount issue.

Step 2.4 Record: fix is small and easy to audit, but there is a
regression concern: Mark Brown noted in review that disabling RX
supplies in `SND_SOC_DAPM_PRE_PMD` before DAPM disables the PGA is “a
bit weird.” He later applied the patch anyway; no NAK or follow-up
correction was found in the thread.

### Phase 3: Git History Investigation
Step 3.1 Record: blame shows the AUX DAC/PA event code came from
`57fe69db7a015e` (“ASoC: codecs: wcd937x: add playback dapm widgets”),
first contained in `v6.11-rc1`. The base controls came from
`82be8c62a38c6a` (“add basic controls”), also first contained in
`v6.11-rc1`.

Step 3.2 Record: no `Fixes:` tag, so no tagged introducer to follow.
Manual blame identifies the relevant introducers above.

Step 3.3 Record: related history includes `041db4bbe04e8` adding a
missing `LO Switch` control, and `107a5c853eef5` relaxing the AUX PDM
watchdog. The candidate’s context includes the watchdog changes, which
are present from `v6.12`.

Step 3.4 Record: no earlier commits by Ajay Kumar Nandam touching
`sound/soc/codecs` or `wcd937x.c` were found on this branch. The patch
was applied by ASoC maintainer Mark Brown.

Step 3.5 Record: dependencies are the existing WCD937x playback widgets,
controls, SoundWire channel definitions, and for clean context the AUX
watchdog update. It applies cleanly to current `7.0` and to a checked
`v6.12` worktree.

### Phase 4: Mailing List And External Research
Step 4.1 Record: `b4 dig -c 74c876bfd71b` found the original patch at
the patch.msgid.link URL. `b4 dig -a` found only `v1`; no later
revision.

Step 4.2 Record: `b4 dig -w` showed appropriate recipients: Srinivas
Kandagatla, Liam Girdwood, Mark Brown, Jaroslav Kysela, Takashi Iwai,
`linux-sound`, `linux-arm-msm`, and `linux-kernel`.

Step 4.3 Record: no separate bug report or syzbot/bugzilla link was
present. Web/lore mirror confirmed the only substantive review comment
was Mark Brown’s sequencing concern.

Step 4.4 Record: no multi-patch series was found; this is a standalone
one-patch submission.

Step 4.5 Record: direct lore stable search via `WebFetch` was blocked by
Anubis; web search did not reveal stable-specific discussion for this
exact patch.

### Phase 5: Code Semantic Analysis
Step 5.1 Record: modified functions/data are
`wcd937x_codec_aux_dac_event()`, `wcd937x_codec_enable_aux_pa()`, and
`wcd937x_snd_controls[]`.

Step 5.2 Record: `rg` found both event functions are referenced only by
DAPM widgets: `RDAC4` uses `wcd937x_codec_aux_dac_event()`, and `AUX
PGA` uses `wcd937x_codec_enable_aux_pa()`.

Step 5.3 Record: key callees are `snd_soc_component_update_bits()`,
`wcd937x_rx_clk_enable()`, `wcd_clsh_ctrl_set_state()`, `enable_irq()`,
and `disable_irq_nosync()`. Mixer controls call `wcd937x_get_swr_port()`
/ `wcd937x_set_swr_port()`.

Step 5.4 Record: call chain is userspace ALSA routing/control changes ->
ASoC DAPM powers the AUX route (`IN3_AUX` -> `RX3` -> `RDAC4` ->
`AUX_RDAC` -> `AUX PGA` -> `AUX`) -> the modified DAPM event callbacks
program the codec. The mixer control path updates SoundWire port/channel
masks used later by `wcd937x_sdw_hw_params()` and
`sdw_stream_add_slave()`.

Step 5.5 Record: similar pattern exists in the same driver history:
`041db4bbe04e8` added a missing `LO Switch` for audio playback routing.
`wcd937x-sdw.c` already defines RX channels for `WCD937X_CLSH`,
`WCD937X_DSD_L`, and `WCD937X_DSD_R`, confirming the new controls target
existing channel definitions.

### Phase 6: Stable Tree Analysis
Step 6.1 Record: `v6.1` and `v6.6` do not contain the relevant WCD937x
AUX code. `v6.11` contains the AUX widgets and channel definitions.
`v6.12` contains the watchdog context used by this patch.

Step 6.2 Record: backport difficulty is clean for `v6.12+`; verified by
creating a detached `v6.12` worktree and running `git apply --check`.
For `v6.11`, the patch may need adjustment or prerequisite
`107a5c853eef5`.

Step 6.3 Record: no alternative fix for this exact AUX PA sequencing /
CLSH+DSD control issue was found in current branch history.

### Phase 7: Subsystem And Maintainer Context
Step 7.1 Record: subsystem is ALSA SoC codec driver under
`sound/soc/codecs`; criticality is driver-specific/peripheral, affecting
systems using Qualcomm WCD937x AUX playback.

Step 7.2 Record: WCD937x is active: recent history includes
probe/resource fixes, SoundWire port fixes, OF node leak fixes, and AUX
watchdog fixes.

### Phase 8: Impact And Risk
Step 8.1 Record: affected users are WCD937x codec users with AUX
playback routes.

Step 8.2 Record: trigger is normal AUX playback setup/routing through
ALSA/ASoC; userspace can trigger routing through mixer controls. Exact
affected board population was not verified.

Step 8.3 Record: failure mode is loss of AUX playback/routing, not a
crash or memory-safety bug. Severity is medium for the kernel generally,
high for affected hardware where AUX playback is required.

Step 8.4 Record: benefit is restoring existing hardware functionality on
affected WCD937x systems. Risk is low to medium: the patch is tiny and
driver-local, but adds visible mixer controls and has one noted
sequencing concern.

### Phase 9: Final Synthesis
Step 9.1 Record: evidence for backporting: fixes existing AUX playback
functionality; small single-driver patch; code and channels already
exist; applies cleanly to `v6.12`; reviewed/applied by ASoC maintainer.
Evidence against: no `Reported-by`/`Tested-by`; not a
crash/security/corruption fix; adds new ALSA controls; maintainer raised
a sequencing concern. Unresolved: exact board/user impact and whether
`v6.11` should receive a hand backport.

Step 9.2 Record: stable rules checklist: obviously correct and tested:
mostly yes by code inspection and maintainer application, but no
explicit `Tested-by`; real bug: yes, broken AUX routing/sequencing;
important issue: yes for affected hardware, though not critical system-
wide; small and contained: yes; no new feature/API: borderline because
mixer controls are user-visible, but they expose existing missing route
controls; applies to stable: yes for `v6.12+`, older active trees
without WCD937x AUX code are not applicable.

Step 9.3 Record: exception category: closest match is hardware-specific
driver functionality fix, not a pure device-ID/quirk/build/doc
exception.

Step 9.4 Record: decision is YES for stable trees containing the WCD937x
AUX playback path, especially `v6.12+`. Do not backport to trees where
the driver/path does not exist.

## Verification
- Phase 1: Read candidate commit message and tags from `git show
  74c876bfd71b` and b4-fetched mbox.
- Phase 2: Verified diff stat: one file, `25 insertions`, `1 deletion`.
- Phase 3: Ran `git blame` on AUX DAC, AUX PA, and controls blocks;
  identified `57fe69db7a015e` and `82be8c62a38c6a`.
- Phase 3: Ran `git describe --contains`; WCD937x AUX/control code
  starts in `v6.11-rc1`; watchdog context starts in `v6.12-rc6`.
- Phase 4: Ran `b4 dig -c 74c876bfd71b`, `-a`, and `-w`; found v1-only
  patch and original recipients.
- Phase 4: Fetched lore mirror; confirmed Mark Brown’s review concern
  and later ASoC application.
- Phase 5: Used `rg` and file reads to trace DAPM widget references, AUX
  route, SoundWire channel definitions, and `wcd937x_sdw_hw_params()`.
- Phase 6: Used `git grep` against `v6.1`, `v6.6`, `v6.11`, and `v6.12`;
  verified absence/presence of relevant code.
- Phase 6: Verified `git apply --check` succeeds on current tree and on
  a temporary detached `v6.12` worktree.
- Unverified: exact affected product/board list; no explicit tester or
  reporter was found.

**YES**

 sound/soc/codecs/wcd937x.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 10a2d598caa71..72a53f95d6887 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -546,6 +546,9 @@ static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
 					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_AUX_AUXPA,
+					      BIT(4), BIT(4));
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
 					      BIT(2), BIT(2));
@@ -562,6 +565,9 @@ static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
 					      BIT(2), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_AUX_AUXPA,
+					      BIT(4), 0x00);
 		break;
 	}
 
@@ -730,10 +736,23 @@ static int wcd937x_codec_enable_aux_pa(struct snd_soc_dapm_widget *w,
 			snd_soc_component_update_bits(component,
 						      WCD937X_ANA_RX_SUPPLIES,
 						      BIT(1), BIT(1));
+		/* Enable AUX PA related RX supplies */
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(6), BIT(6));
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(7), BIT(7));
 		enable_irq(wcd937x->aux_pdm_wd_int);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		disable_irq_nosync(wcd937x->aux_pdm_wd_int);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(6), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(7), 0x00);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		usleep_range(2000, 2010);
@@ -2051,7 +2070,12 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("LO Switch", WCD937X_LO, 0, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
-
+	SOC_SINGLE_EXT("CLSH PA Switch", WCD937X_CLSH, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_L Switch", WCD937X_DSD_L, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_R Switch", WCD937X_DSD_R, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("ADC1 Switch", WCD937X_ADC1, 1, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("ADC2 Switch", WCD937X_ADC2, 1, 1, 0,
-- 
2.53.0


