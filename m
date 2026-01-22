Return-Path: <linux-arm-msm+bounces-90237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PV8DLxccmn5iwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:22:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 437986B240
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 416E43004633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE943DD1EE;
	Thu, 22 Jan 2026 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="AR0fbsTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B2B23A564;
	Thu, 22 Jan 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100254; cv=none; b=KlyIDa5SPndo6e1pyCr2k1ghn3QebRmGans4GYXfxHhmz9jqAuMcmirx5pp5bxjOoe6VABhPhcu8rAaihDuJ70bIDM+989pWo7NVrm8bvioakymu21oFQsnBrX1imSXGH5Wa3zIrybbVmLsjsECN+oMOFq8EqbWxKohRH5pUEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100254; c=relaxed/simple;
	bh=JG3LovOo8OfCeba/0jDRYVdiBKX1vrAercPsQQOpn1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGjQhB2pUlBtycjpqWOE7MSUJT8lq2IbNVgOWbWFP+lxAIdK3hSRS5dXsn0BSg1cfSlGm4dQ8CvMAk9eVaZqkwOj68cpy8WgSQbh8zXOjvlcp4ljQocfMYvJe8EGYbV4CB3X9t3f1QZ7dbM80jnzBpCLdA5ZUi4U54LzwNRPW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=AR0fbsTP; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=X9lPr1dy2g4CLgGWk8MZMnU50xnfxCrtzUVtOSbSm0I=; b=AR0fbsTPXZkzdbGXnccGYrwTWn
	cpBIF9bEaeWJinAH2u3C+MN2HY6jjQuFrycTKsSwKI6kQu2EA4aNLRYJtBrxI9tFGaW6p/mYmRRpH
	aacCNYznPDzbkhj7NtAXbvhEdfztY+JuzoUHXmhyort5q/iBZgDxbkkz1lQpkp88KoQE=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1vixms-000000060gQ-2E8B;
	Thu, 22 Jan 2026 19:44:02 +0300
Message-ID: <ac83f41e-08ad-4ffe-9f0e-02f8256af65c@minlexx.ru>
Date: Thu, 22 Jan 2026 19:44:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-4-morf3089@gmail.com>
 <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[minlexx.ru:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[minlexx.ru : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90237-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[minlexx.ru:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,minlexx.ru:mid]
X-Rspamd-Queue-Id: 437986B240
X-Rspamd-Action: no action

On 21.01.2026 14:27, Konrad Dybcio wrote:
> On 1/20/26 7:00 PM, Gianluca Boiano wrote:
>> Fix regulator configurations to ensure stable operation:
>> - vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
>>    PLL operation
> 
> The driver needs to be fixed instead, as it should perform a
> regulator_set_load()


Also change done by me in [1] with more detailed explanation:

Since the commit f05ab10 ("arm64: dts: qcom: sdm660-lavender:
Add missing USB phy supply") previously untouched by Linux regulator
l10a is now used, but it exposed a bug from initial porting: when
booting with USB cable inserted, or booting without cable and
inserting it later, board reboots.

Downstream vendor device tree has this:

	rpm-regulator-ldoa10 {
		status = "okay";
		pm660_l10: regulator-l10 {
			proxy-supply = <&pm660_l10>;
			qcom,proxy-consumer-enable;
			qcom,proxy-consumer-current = <14000>;
			regulator-min-microvolt = <1780000>;
			regulator-max-microvolt = <1950000>;
			status = "okay";
		};
	};

IIRC this qcom,proxy-consumer stuff is adding fake device that uses this
regulator, but does nothing else except requesting specified voltage or
current (in this case), until "real consumer" probes or something like
that. The same can be achieved by simply adding regulator-system-load,
and device stops rebooting when USB cable is inserted.

This is also needed for all xiaomi-sdm660 boards, but not e.g on
sdm630-sony ones.

I'm thinking maybe it is better to have regulators in sdm660-xiaomi-
common.dtsi after all. The setup is mostly the same for them.

[1] 
https://github.com/sdm660-mainline/linux/commit/7121e17ee284bb6026c25d3f643fd020fa959877

--
Regards,
Alexey Minnekhanov

