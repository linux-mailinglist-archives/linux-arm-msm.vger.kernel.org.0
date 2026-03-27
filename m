Return-Path: <linux-arm-msm+bounces-100342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /7C4CBSQxmkyMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:11:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F974345D0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 328AD3030B29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E37F3EF66D;
	Fri, 27 Mar 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gN1C4vUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C57289E06;
	Fri, 27 Mar 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620433; cv=none; b=q9tFEd4T9/JcTwwS42N7vZXpj0W4ySje/uqDIiUfo1exXlv8/zta/H5ipNXWbjtVnSm5RYSgWIV50dXcFxwhpKhu81xN/UHEIo5ch4EUKfevJGfauFhjUurXGl514oGio6rIUR48P1WFo+Cp4gPs92+CL/WckKO1oUCj7499jvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620433; c=relaxed/simple;
	bh=hWJlZNKlAaItYJvhnDmGAEIGtys9dKI210vA5dw6Gqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXQrFzTSvoB9lqPYc9Ga8ItcGyS91RDMil5KB6hTarHX46dVArQpl/IsOspvYKxJcijT8/E6w/b6zPB6mgIFIfKFLifjnd2/47nglfCG9o+qK3KEiBsE4o4NDmym8bB/RqGFEh5UgYhqBZ+1gwEYJVDfplJIJc8Df1NgqyT2iec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gN1C4vUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846BAC19423;
	Fri, 27 Mar 2026 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620433;
	bh=hWJlZNKlAaItYJvhnDmGAEIGtys9dKI210vA5dw6Gqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gN1C4vUYUXB+7UEawc1PcM+V8n2yDJnE8RUs/p6dPiHH0hrRvfvdNZ6V+WGrqVpiE
	 WjvpKR3uJl98bo9JYdDDaAmciiqnUpbLX8HKPq/ggFpHJYh80gfJbNyZV/1KebQjRK
	 +NgkrXqvhN+gD2loKoMpnVFDOOlDpxi/X/qUK4zWDNvk5idq5pbHo/orDJGyySwOQL
	 pJjn22TiFoR/rnyF+ZVJUBXDbgfmPb2K2C3YHqHsjqteRsXMDwXX6CWMhyVRQcoNKQ
	 OLPZzK6vboSLI4XKmuFeWJdI+QTkto4qUzB7O2JVXrj+dnxsUTCfPXXzJnza1N84Dl
	 1AQd9BRpLhScA==
Date: Fri, 27 Mar 2026 15:07:04 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v20 04/10] firmware: psci: Introduce command-based reset
 in psci_sys_reset
Message-ID: <acaPCJnX6lb9lxPy@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-4-cf7d346b8372@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-4-cf7d346b8372@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100342-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lpieralisi@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F974345D0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 04, 2026 at 11:33:04PM +0530, Shivendra Pratap wrote:
> PSCI currently supports only COLD reset and ARCH WARM reset based on the
> Linux reboot_mode variable. The PSCI specification now includes
> SYSTEM_RESET2 for vendor-specific resets, but there's no mechanism to
> issue these through psci_sys_reset.
> 
> Add a command-based reset mechanism that allows external drivers to set
> the psci reset command via a new psci_set_reset_cmd() function.
> 
> The psci command-based reset is disabled by default and the
> psci_sys_reset follows its original flow until a psci_reset command is
> set. In kernel panic path, psci_reset command is ignored.

If it is function calls you should add parenthesis (eg psci_sys_reset ->
psci_sys_reset()).

You must explain why the kernel panic path requires separate handling
here AND in the code - think about looking at this years down the line
and figure out why kernel panics are special here.

> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/psci/psci.c | 45 ++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/psci.h         |  2 ++
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ae6f7a0aead913d740070080d4b2a3da15b29485 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -51,6 +51,15 @@ static int resident_cpu = -1;
>  struct psci_operations psci_ops;
>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>  
> +struct psci_sys_reset_params {
> +	u32 system_reset;
> +	u32 reset_type;
> +	u32 cookie;
> +	bool cmd;
> +};
> +
> +static struct psci_sys_reset_params psci_reset;
> +
>  bool psci_tos_resident_on(int cpu)
>  {
>  	return cpu == resident_cpu;
> @@ -80,6 +89,28 @@ static u32 psci_cpu_suspend_feature;
>  static bool psci_system_reset2_supported;
>  static bool psci_system_off2_hibernate_supported;
>  
> +/**
> + * psci_set_reset_cmd - Sets the psci_reset_cmd for command-based
> + * reset which will be used in psci_sys_reset call.
> + *
> + * @cmd_sys_rst2: Set to true for SYSTEM_RESET2 based resets.
> + * @cmd_reset_type: Set the reset_type argument for psci_sys_reset.
> + * @cmd_cookie: Set the cookie argument for psci_sys_reset.
> + */
> +void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie)
> +{

I don't think cmd_sys_rst2 is needed, as a replied in a different thread.

> +	if (cmd_sys_rst2 && psci_system_reset2_supported) {
> +		psci_reset.system_reset = PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
> +		psci_reset.reset_type = cmd_reset_type;
> +		psci_reset.cookie = cmd_cookie;
> +	} else {
> +		psci_reset.system_reset = PSCI_0_2_FN_SYSTEM_RESET;
> +		psci_reset.reset_type = 0;
> +		psci_reset.cookie = 0;
> +	}
> +	psci_reset.cmd = true;
> +}
> +
>  static inline bool psci_has_ext_power_state(void)
>  {
>  	return psci_cpu_suspend_feature &
> @@ -309,14 +340,24 @@ static int get_set_conduit_method(const struct device_node *np)
>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>  			  void *data)
>  {
> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> -	    psci_system_reset2_supported) {
> +	if (((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> +	     psci_system_reset2_supported) && (panic_in_progress() || !psci_reset.cmd)) {
>  		/*
>  		 * reset_type[31] = 0 (architectural)
>  		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
>  		 * cookie = 0 (ignored by the implementation)
>  		 */
>  		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
> +	} else if (!panic_in_progress() && psci_reset.cmd) {
> +		/*
> +		 * Commands are being set in psci_set_reset_cmd
> +		 * This issues, SYSTEM_RESET2 arch warm reset or
> +		 * SYSTEM_RESET2 vendor-specific reset or
> +		 * a SYSTEM_RESET cold reset in accordance with
> +		 * the reboot-mode command.
> +		 */
> +		invoke_psci_fn(psci_reset.system_reset, psci_reset.reset_type,
> +			       psci_reset.cookie, 0);
>  	} else {
>  		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);

This is very hard to parse. IMO, what you should do is:

- Split this into two different paths: reboot_mode vs psci_reset.cmd == true.
- Document very clearly why a panic needs separate handling.

Something like:

if (psci_reset.cmd)
	handle_reset_cmd();
else
	handle_reboot_mode();

I don't think we are far from converging but I want to be able to maintain
this code going forward.

Thanks,
Lorenzo

>  	}
> diff --git a/include/linux/psci.h b/include/linux/psci.h
> index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..d13ceca88eab8932894051e7c86e806c2ad8a73a 100644
> --- a/include/linux/psci.h
> +++ b/include/linux/psci.h
> @@ -45,8 +45,10 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
>  
>  #if defined(CONFIG_ARM_PSCI_FW)
>  int __init psci_dt_init(void);
> +void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie);
>  #else
>  static inline int psci_dt_init(void) { return 0; }
> +static inline void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie) { }
>  #endif
>  
>  #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)
> 
> -- 
> 2.34.1
> 

