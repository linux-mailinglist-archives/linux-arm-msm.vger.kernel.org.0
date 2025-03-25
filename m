Return-Path: <linux-arm-msm+bounces-52465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D5A70319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D1A47A30BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A072586C3;
	Tue, 25 Mar 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgxwWYGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EACF2566FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911431; cv=none; b=EHbPxoAR9F5hS4OQl2GQN5HIglUZB2h0VVDhBqGovJgWQV68bNB9aK5v0e2vpI4ehwBTRcCoBt+xomnGOyhwmHdc7iTNFuT6mFO8oLCIWXDupnfUxuQw3iMvB0W4Ekh4Ft87NiFsRv6YnEu0MEZaHA4kPvF3Jjkh06V6hvR4RO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911431; c=relaxed/simple;
	bh=751jpRvxTP7qXUFkQp7z9zoqq7FMnAhXrspgDE7t0ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgtDaCvFeWo38U2MuMFp6oL7l9dFxMEEIEfBzfh0Yjquodgw+4eZd6qTQpEdE+R0CUiw06cxR1czq7fBQeWBnJxMSSauCTROtyM3RGfBLwC09UMfyd0PKOhlLfdBaNu6rRxqsyv5rl1L0fqfivKriaSJXqhbTZXsLz3J6NNc6mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgxwWYGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDdCFp032535
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8+OV30Ke0OQlvHx9FJ4l7yTT
	crZlafSc5GoCEvCnavs=; b=DgxwWYGAzzheE7TgTyY86UHR2HHsPUKgTYCXNs3d
	wcFbVzyySKvRN9nV2m8ybu15e0hrxlvPIm32yiYvweArhlrVswHGMhS89iydEbe6
	74+3PBDOFbnCOz9leUnm37unebceA1CftqNTJvj5BUl9AvNMAF+Oce/GjNr30po2
	4tyi7+9XEbDHnGxgIfnn8EUmeCCDWSbVuyZtIlMR8wIQVxdGOe55E1LQosiEIwIK
	KF/Y8sNyEujB2u9B30HueJoX5rB+eTedunQEZdSd7fDqN54gt37yR3JyCaO7C3a9
	kamKGMy2cOMrdcyJJjl6B9Wjm7ZpNfjmbOHZe1+DUIi6xw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd31sp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:03:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227a8cdd272so37412245ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 07:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911427; x=1743516227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+OV30Ke0OQlvHx9FJ4l7yTTcrZlafSc5GoCEvCnavs=;
        b=jKo5J+L3Xj8QQyCSBUqTZkgxshkNw2xy4rOZTrTAU7Lzh2Eznyz8xGChdlX0wVmDwQ
         RJIYnkam6ZyDSR/cP8yjO6F0wSfi8DkzP3YPgrIPe/2oSfJ+zgtFcUez/rxTupHy4g5B
         9rxIRMwG5ugRHK0Zg20ojOrzEzQQmw5ofrczNYPRDEpOumVAj6F9oG8+iIsAc0TXD10U
         Ku6SideX/ryJP/Kp89u7uKWKxbGhBPqKQp/XY90g9EoWzayNZZgj5hTSpjZXym+3qBmO
         wi9g4kfydcvFgDYQoW5/RNK6u4KRMruuvkzZuRHGzTMmM/Ha5cVnpbFKtsEz1VMqfRjB
         WQBA==
X-Forwarded-Encrypted: i=1; AJvYcCXLTYQiuvVMcUKF5+I6imkEcsJcc9EOSknYt81qm98teTvgG71Q6mylwae6TA+qyOpMUkZUtCFX5B8rABtk@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSZBl5l+EZxc99B4SDlQTeCNQR3EYUd+gcDXKgFcIObAVPNZX
	H//+JGcO3jzCH296oHIF0bEaR6Z4AL99DsdFXa1hWEEi+G/01s+4EWNrlJ9Y1nxei6uRNsBFW9f
	EReBh/y6j59Hq1PZxA9xAoiVtcqCGeXjQHxrkEtyz4BwpD73zrE6nQyr9GP8c9Hln
X-Gm-Gg: ASbGncuQu3Q4dB3Pld8/j9IeKmE3ug2bSMZOcGE7VqOFtTesxwYxnABH2zYv0DZSkth
	kTxlrrO2FahkkattzWQSQ53DoHMjFV0wl0Bld6lormt7S972ehksbfgl0V3N0g6RkGbiSHFIAl4
	+tkbeA4BD1yMW4QE49NjAzZ9Qsw9gLEjDkapx42M/5HAzRIh5fbFLRLptvSvRRjQ3jLfqS3GtCP
	KDtC0LumCgmREXqdZMUgAGEvNBFr6vr0tpwu5DGl1n7zuquD/Y9crS0YTwjmHXU2vzN0lSOd/Je
	l6hGSiyA9Tt2Kh8u/OvLs5XlWyT9OF1O2hlpGzaI++M=
X-Received: by 2002:a17:902:f084:b0:224:c7c:7146 with SMTP id d9443c01a7336-22780c54d42mr169438415ad.6.1742911426635;
        Tue, 25 Mar 2025 07:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbNSNxwqRpeGEIa+PRTFNX2l7otE9uzBL+l4MpRSESqIyfb/WaExHc5CZYJsWuUeIjXx6SPw==
X-Received: by 2002:a17:902:f084:b0:224:c7c:7146 with SMTP id d9443c01a7336-22780c54d42mr169437745ad.6.1742911425988;
        Tue, 25 Mar 2025 07:03:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811c1b8fsm89941585ad.154.2025.03.25.07.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:03:45 -0700 (PDT)
Date: Tue, 25 Mar 2025 19:33:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
Message-ID: <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
 <Z9QQw6BcE7IXzu+r@lpieralisi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9QQw6BcE7IXzu+r@lpieralisi>
X-Proofpoint-GUID: xxeQIr7RX5eXpqrXSW9nFI7DMkbMAHMY
X-Proofpoint-ORIG-GUID: xxeQIr7RX5eXpqrXSW9nFI7DMkbMAHMY
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e2b7c4 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=GcyzOjIWAAAA:8 a=EUspDBNiAAAA:8 a=W06eqCPg62U6qe7cA7cA:9 a=CjuIK1q_8ugA:10
 a=dtxw0mqMjrQA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=hQL3dl6oAZ8NdCsdz28n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250099

On Fri, Mar 14, 2025 at 12:19:31PM +0100, Lorenzo Pieralisi wrote:
> On Mon, Mar 03, 2025 at 01:08:31PM -0800, Elliot Berman wrote:
> > From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > 
> > SoC vendors have different types of resets and are controlled through
> > various registers. For instance, Qualcomm chipsets can reboot to a
> > "download mode" that allows a RAM dump to be collected. Another example
> > is they also support writing a cookie that can be read by bootloader
> > during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> > vendor reset types to be implemented without requiring drivers for every
> > register/cookie.
> > 
> > Add support in PSCI to statically map reboot mode commands from
> > userspace to a vendor reset and cookie value using the device tree.
> 
> I have managed to discuss a little bit this patchset over the last
> few days and I think we have defined a plan going forward.
> 
> A point that was raised is:
> 
> https://man7.org/linux/man-pages/man2/reboot.2.html
> 
> LINUX_REBOOT_CMD_RESTART2 *arg command, what is it supposed to
> represent ?
> 
> Is it the mode the system should reboot into OR it is the
> actual command to be issued (which is what this patchset
> implements) ?
> 
> LINUX_REBOOT_CMD_RESTART "..a default restart..."
> 
> It is unclear what "default" means. We wonder whether the
> reboot_mode variable was introduced to _define_ that "default".
> 
> So, in short, my aim is trying to decouple reboot_mode from the
> LINUX_REBOOT_CMD_RESTART2 *arg command.
> 
> I believe that adding a sysfs interface to reboot-mode driver
> infrastructure would be useful, so that the commands would
> be exposed to userspace and userspace can set the *arg command
> specifically to issue a given reset/mode.
> 
> I wonder why this is not already in place for eg syscon-reboot-mode
> resets, how does user space issue a command in those systems if the
> available commands aren't exposed to userspace ?
> 
> Is there a kernel entity exposing those "modes" to userspace, somehow ?
> 
> > A separate initcall is needed to parse the devicetree, instead of using
> > psci_dt_init because mm isn't sufficiently set up to allocate memory.
> > 
> > Reboot mode framework is close but doesn't quite fit with the
> > design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> > be solved but doesn't seem reasonable in sum:
> >  1. reboot mode registers against the reboot_notifier_list, which is too
> >     early to call SYSTEM_RESET2. PSCI would need to remember the reset
> >     type from the reboot-mode framework callback and use it
> >     psci_sys_reset.
> >  2. reboot mode assumes only one cookie/parameter is described in the
> >     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
> >     cookie.
> 
> This can be changed and I think it should, so that the reboot modes
> are exposed to user space and PSCI can use that.
> 
In the case of a regular reboot or panic, the reboot/panic notifiers run
first, followed by the restart notifiers. The PSCI reset/reset2 should
be the last call from Linux, and ideally, this call should not fail.

Reboot mode notifiers => restart notifiers or Panic notifiers => restart
notifiers

So, if I understand correctly, you mean that we can change the reboot
mode framework to expose the arguments available to user space. We can
extend it to accept magic and cookies, save them in the reboot
framework, and retrieve them via a call from PSCI during a regular
reboot or panic based on the current arguments. Is this leading towards
writing an ARM-specific PSCI-reboot-mode driver, which in its reboot
notifier callback saves the magic and cookies, and these magic and
cookies will be used during psci_sys_reset2()? Or is there something
wrong with my understanding?

P.S. We appreciate Elliot for his work and follow-up on this while being
employed at Qualcomm.

> >  3. psci cpuidle driver already registers a driver against the
> >     arm,psci-1.0 compatible. Refactoring would be needed to have both a
> >     cpuidle and reboot-mode driver.
> > 
> > Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > ---
> >  drivers/firmware/psci/psci.c | 105 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> > 
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index a1ebbe9b73b136218e9d9f9b8daa7756b3ab2fbe..6f8c47deaec0225f26704e1f3bcad52603127a85 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -80,6 +80,14 @@ static u32 psci_cpu_suspend_feature;
> >  static bool psci_system_reset2_supported;
> >  static bool psci_system_off2_hibernate_supported;
> >  
> > +struct psci_reset_param {
> > +	const char *mode;
> > +	u32 reset_type;
> > +	u32 cookie;
> > +};
> > +static struct psci_reset_param *psci_reset_params __ro_after_init;
> > +static size_t num_psci_reset_params __ro_after_init;
> > +
> >  static inline bool psci_has_ext_power_state(void)
> >  {
> >  	return psci_cpu_suspend_feature &
> > @@ -306,9 +314,39 @@ static int get_set_conduit_method(const struct device_node *np)
> >  	return 0;
> >  }
> >  
> > +static int psci_vendor_system_reset2(const char *cmd)
> > +{
> > +	unsigned long ret;
> > +	size_t i;
> > +
> > +	for (i = 0; i < num_psci_reset_params; i++) {
> > +		if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > +			ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > +					     psci_reset_params[i].reset_type,
> > +					     psci_reset_params[i].cookie, 0);
> > +			/*
> > +			 * if vendor reset fails, log it and fall back to
> > +			 * architecture reset types
> 
> That's not what the code does.
> 
Ack.

-Mukesh

> > +			 */
> > +			pr_err("failed to perform reset \"%s\": %ld\n", cmd,
> > +			       (long)ret);
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return -ENOENT;
> > +}
> > +
> >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> >  			  void *data)
> >  {
> > +	/*
> > +	 * try to do the vendor system_reset2
> > +	 * If there wasn't a matching command, fall back to architectural resets
> > +	 */
> > +	if (data && !psci_vendor_system_reset2(data))
> > +		return NOTIFY_DONE;
> > +
> >  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> >  	    psci_system_reset2_supported) {
> >  		/*
> > @@ -795,6 +833,73 @@ static const struct of_device_id psci_of_match[] __initconst = {
> >  	{},
> >  };
> >  
> > +#define REBOOT_PREFIX "mode-"
> > +
> > +static int __init psci_init_system_reset2_modes(void)
> > +{
> > +	const size_t len = strlen(REBOOT_PREFIX);
> > +	struct psci_reset_param *param;
> > +	struct device_node *psci_np __free(device_node) = NULL;
> > +	struct device_node *np __free(device_node) = NULL;
> > +	struct property *prop;
> > +	size_t count = 0;
> > +	u32 magic[2];
> > +	int num;
> > +
> > +	if (!psci_system_reset2_supported)
> > +		return 0;
> > +
> > +	psci_np = of_find_matching_node(NULL, psci_of_match);
> > +	if (!psci_np)
> > +		return 0;
> > +
> > +	np = of_find_node_by_name(psci_np, "reset-types");
> > +	if (!np)
> > +		return 0;
> 
> Related to my initial question above. If LINUX_REBOOT_CMD_RESTART2 *arg command,
> is the actual reset to be issued, should we add a default mode "cold"
> and, if SYSTEM_RESET2 is supported, a "warm" reset mode too ?
> 
> It all boils down to what *arg represents - adding "cold" and "warm"
> modes would remove the dependency on reboot_mode for resets issued
> through LINUX_REBOOT_CMD_RESTART2, the question is whether this
> is the correct thing to do.
> 
> Comments very welcome.
> 
> Thanks,
> Lorenzo
> 
> > +
> > +	for_each_property_of_node(np, prop) {
> > +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> > +			continue;
> > +		num = of_property_count_u32_elems(np, prop->name);
> > +		if (num != 1 && num != 2)
> > +			continue;
> > +
> > +		count++;
> > +	}
> > +
> > +	param = psci_reset_params =
> > +		kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
> > +	if (!psci_reset_params)
> > +		return -ENOMEM;
> > +
> > +	for_each_property_of_node(np, prop) {
> > +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> > +			continue;
> > +
> > +		num = of_property_read_variable_u32_array(np, prop->name, magic,
> > +							  1, ARRAY_SIZE(magic));
> > +		if (num < 0) {
> > +			pr_warn("Failed to parse vendor reboot mode %s\n",
> > +				param->mode);
> > +			kfree_const(param->mode);
> > +			continue;
> > +		}
> > +
> > +		param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> > +		if (!param->mode)
> > +			continue;
> > +
> > +		/* Force reset type to be in vendor space */
> > +		param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
> > +		param->cookie = num > 1 ? magic[1] : 0;
> > +		param++;
> > +		num_psci_reset_params++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +arch_initcall(psci_init_system_reset2_modes);
> > +
> >  int __init psci_dt_init(void)
> >  {
> >  	struct device_node *np;
> > 
> > -- 
> > 2.34.1
> > 

