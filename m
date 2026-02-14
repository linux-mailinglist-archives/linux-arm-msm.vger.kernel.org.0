Return-Path: <linux-arm-msm+bounces-92835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGW8D+TJj2nMTgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 02:03:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A783713A462
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 02:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AA3230517FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 01:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806E122129B;
	Sat, 14 Feb 2026 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkL5yBGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0331DE8AE;
	Sat, 14 Feb 2026 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771030977; cv=none; b=Z2RBslPnujnIc5nGps2sim/7JAEJkzCs6DMvbWub1123h3hqzMNNPyNd1M7XSkdcNpdg1svKzrz+vwNLrJKe8veuheyqLcpFnTt1yvw6CpQcqneTVhHGJ2Ke83a831be2pD2s0OO5fU1ch11jscCORxUpFo3h+w66/hRfOztmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771030977; c=relaxed/simple;
	bh=J37sxq8pfLFgbWzCtYcfjLaOxT+W9jkKzT/+ehOmyy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/TFQDV75ZzsyAj+4itMu1JCngtJ/fr+dDQmiocXidbPJohh+83psV8lTUfcHPNAo5ZrmJVDoBHK2P6Umxl3xoEPTtJdae8P9z9pTOjSANFCsq7WIUOKdC3a4yVCYRbLUbCufOEMXZaeMzBe70EmwC3Vl/OrEBQ7XavRQhVhE7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkL5yBGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521C7C116C6;
	Sat, 14 Feb 2026 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771030977;
	bh=J37sxq8pfLFgbWzCtYcfjLaOxT+W9jkKzT/+ehOmyy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NkL5yBGWc6TK9nHx2hxtMCGxj24z7Nx2oQsm74KUE5oOhf1y7RBu4JQ7Vmylhaf+k
	 dnOG8L4pIj8Q7WftquaBobZR/0YIlN1+vVXkNXzOa00Uq9Dw1NHF8FWISar1QaKUaE
	 PPhYP8ngWel42iL3JY93dLL0FhxiiWlgaEp5uWZIdcav8euA2/IyTT6SYC6muemmqi
	 Napo6EQ9SgX9nWsTYF6LgztR4JCpCXcwaiCx7gScbyyD2oQ1TBgceDWBiB2mqteN8A
	 w1PrBmQS1YAUZDxgdqz6QRbKZQ2/IouBnlcIxxZ+hRxVHlG8Q3a7Uk6Ykq7EUu6dkt
	 /eJr0zFNjEh8g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jonathan Marek <jonathan@marek.ca>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] spi-geni-qcom: initialize mode related registers to 0
Date: Fri, 13 Feb 2026 19:58:06 -0500
Message-ID: <20260214010245.3671907-6-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:email,msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A783713A462
X-Rspamd-Action: no action

From: Jonathan Marek <jonathan@marek.ca>

[ Upstream commit 739062a9f1e9a77a9687c8fd30f8e5dd12ec70be ]

setup_fifo_params assumes these will be zero, it won't write these
registers if the initial mode is zero.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Link: https://patch.msgid.link/20251120211204.24078-4-jonathan@marek.ca
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete understanding of the bug and the fix. Let me
compile the analysis.

---

## Detailed Analysis

### 1. COMMIT MESSAGE ANALYSIS

The commit subject "spi-geni-qcom: initialize mode related registers to
0" is straightforward. The commit body explains: "`setup_fifo_params`
assumes these will be zero, it won't write these registers if the
initial mode is zero." This is a clear description of a latent
initialization bug.

### 2. CODE CHANGE ANALYSIS - The Bug Mechanism

The bug centers on the interaction between two functions in `spi-geni-
qcom.c`:

**`spi_geni_init()`** (called once during probe at line 1147)
initializes the GENI SPI controller. In the `case 0:` (FIFO mode) branch
at lines 724-728, it sets the transfer mode but does NOT initialize the
SPI mode registers.

**`setup_fifo_params()`** (called for each SPI message at line 593 via
`spi_geni_prepare_message`) has an optimization at line 405:

```397:431:drivers/spi/spi-geni-qcom.c
static int setup_fifo_params(struct spi_device *spi_slv,
                                        struct spi_controller *spi)
{
        struct spi_geni_master *mas = spi_controller_get_devdata(spi);
        struct geni_se *se = &mas->se;
        u32 loopback_cfg = 0, cpol = 0, cpha = 0, demux_output_inv = 0;
        u32 demux_sel;

        if (mas->last_mode != spi_slv->mode) {
                // ... only writes registers when mode changes ...
                writel(loopback_cfg, se->base + SE_SPI_LOOPBACK);
                writel(demux_sel, se->base + SE_SPI_DEMUX_SEL);
                writel(cpha, se->base + SE_SPI_CPHA);
                writel(cpol, se->base + SE_SPI_CPOL);
                writel(demux_output_inv, se->base +
SE_SPI_DEMUX_OUTPUT_INV);

                mas->last_mode = spi_slv->mode;
        }
        // ...
}
```

**The critical chain of assumptions:**

1. `spi_geni_master` is allocated with `kzalloc` (confirmed in
   `__spi_alloc_controller` at spi.c line 3056), so `mas->last_mode`
   starts at **0**.
2. `SPI_MODE_0` = `(0|0)` = **0** (from `include/uapi/linux/spi/spi.h`
   line 10). This is the most common SPI mode.
3. When the first SPI device uses mode 0, `spi_slv->mode` is 0, so
   `mas->last_mode != spi_slv->mode` is **false** (0 != 0 → false).
4. **The register writes are skipped entirely** for the first SPI
   transaction.
5. This assumes the hardware registers already contain 0.

**When the assumption breaks:**

- **Bootloader contamination**: If the bootloader used SPI (very common
  on Qualcomm SoCs for reading from SPI flash/NOR), it may have
  configured these registers with non-zero values (e.g., CPOL=1, CPHA=1
  for SPI mode 3, or specific chip select muxing).
- **Firmware loading path**: The `geni_load_se_firmware()` path (line
  674-679) loads QUP firmware when `proto == GENI_SE_INVALID_PROTO`.
  After firmware loading, register state may be undefined.

**The consequence:**

If hardware registers retain stale non-zero values from the bootloader
and the first SPI device uses mode 0:
- **SE_SPI_CPOL** could be set to `BIT(2)` → wrong clock polarity
- **SE_SPI_CPHA** could be set to `BIT(0)` → wrong clock phase
- **SE_SPI_LOOPBACK** could be enabled → data loops back instead of
  going to device
- **SE_SPI_DEMUX_SEL** could select wrong chip → wrong device addressed
- **SE_SPI_DEMUX_OUTPUT_INV** could invert CS → chip select logic
  inverted

Any of these would cause **SPI communication failure or data
corruption**.

### 3. THE FIX

The fix is 5 `writel(0, ...)` calls added to the FIFO mode
initialization path in `spi_geni_init()`:

```c
writel(0, se->base + SE_SPI_LOOPBACK);
writel(0, se->base + SE_SPI_DEMUX_SEL);
writel(0, se->base + SE_SPI_CPHA);
writel(0, se->base + SE_SPI_CPOL);
writel(0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
```

This ensures the hardware state matches the software assumption
(`last_mode = 0`), making `setup_fifo_params()`'s optimization correct.

### 4. CLASSIFICATION

- **Type**: Initialization bug fix (uninitialized hardware register
  state)
- **NOT a feature**: No new functionality, just ensuring correct
  initialization
- **Category**: Data corruption / device communication failure fix

### 5. SCOPE AND RISK ASSESSMENT

- **Lines changed**: 6 (5 writel + 1 comment)
- **Files touched**: 1 (`drivers/spi/spi-geni-qcom.c`)
- **Complexity**: Extremely low - simple register zeroing
- **Risk of regression**: Near zero. In the common case where registers
  are already 0, the writel calls are a harmless no-op. In the bug case,
  they fix incorrect register values.
- **Self-contained**: Yes - all register defines (`SE_SPI_LOOPBACK`,
  etc.) and the `spi_geni_init()` function exist in all stable trees
  that have this driver.

### 6. USER IMPACT

- **Qualcomm GENI SPI** is used on many Qualcomm SoCs (SDM845, SM8150,
  SM8250, SC7180, SC7280, SM8350, SM8450, X1E80100, etc.)
- These SoCs power phones, laptops (Qualcomm-based Chromebooks, Windows
  on ARM devices), IoT, and embedded systems
- SPI is used for touchscreen controllers, sensor hubs, TPM modules, and
  other critical peripherals
- If SPI communication fails, the affected device simply doesn't work

### 7. DEPENDENCY CHECK

The patch is **entirely self-contained**. It uses:
- `se->base` - available since the driver was created
- `SE_SPI_LOOPBACK`, `SE_SPI_DEMUX_SEL`, `SE_SPI_CPHA`, `SE_SPI_CPOL`,
  `SE_SPI_DEMUX_OUTPUT_INV` - all defined in the same file since
  original driver creation
- `writel()` - standard kernel API

The patch was "4/N" in a series (from the Link URL), but this specific
change is independent. It does not depend on any prior patch in the
series - it simply adds register zeroing to an existing function.

### 8. STABILITY INDICATORS

- Merged by Mark Brown (SPI subsystem maintainer) with `Signed-off-by`
- The fix is logically obvious and defensive
- The pattern (writing 0 to ensure known state during init) is standard
  practice throughout the kernel

### CONCLUSION

This commit fixes a real initialization bug where SPI mode-related
hardware registers may retain stale non-zero values from
bootloader/firmware, causing the driver's `setup_fifo_params()`
optimization to incorrectly skip the first register write when the SPI
device uses mode 0 (the most common mode). The consequence is SPI
communication failure or data corruption. The fix is a trivial 5-line
addition of register zeroing during init, with essentially zero
regression risk, affecting a widely-deployed Qualcomm SPI driver. It is
self-contained with no dependencies and applies cleanly to stable trees.

**YES**

 drivers/spi/spi-geni-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a0d8d3425c6c6..9e9953469b3a0 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -724,6 +724,12 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	case 0:
 		mas->cur_xfer_mode = GENI_SE_FIFO;
 		geni_se_select_mode(se, GENI_SE_FIFO);
+		/* setup_fifo_params assumes that these registers start with a zero value */
+		writel(0, se->base + SE_SPI_LOOPBACK);
+		writel(0, se->base + SE_SPI_DEMUX_SEL);
+		writel(0, se->base + SE_SPI_CPHA);
+		writel(0, se->base + SE_SPI_CPOL);
+		writel(0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
 		ret = 0;
 		break;
 	}
-- 
2.51.0


