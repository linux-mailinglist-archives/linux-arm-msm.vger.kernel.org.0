Return-Path: <linux-arm-msm+bounces-115115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uBMwBsZ8QmqQ8QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:10:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B916DBC93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HM2ZNCbr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="GHFU/p4o";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5440430D30E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEC62D8393;
	Mon, 29 Jun 2026 13:44:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660F29B799
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740675; cv=none; b=DYtWncE+XIqdYX+y6sTeKBm9oHfxPlEPEfWMl6IyfasbPTiko6s5PpV8rd5zwYK1hVk9s/T+PL5mwfPdaXDSgTo02QGi22dpc5T5iGCOFh9498uIBtgO/Q7MwkBTQrkWC8J3aZYOUxFWhaLHstPfcOl/4kgTnPeikXcNgdT3jhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740675; c=relaxed/simple;
	bh=2PcU0CU6jROtev2cX4JA1crRGrmou+RXG2XjGE271yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YApl1UkJrjpo0JSU7gSvPs4KPoBjwelLgdS9IQDiyzhBMT/TIoFrzL9Hy3IsYNLiwMnhoLcrfrmnGr2vndlCDZvQfafwbiEyI+EF/SHPWyeRjjaNzoWpUfg2kY5LEpDkQjnUMaVjY9oR35ZnMdKEn7nknYIkfPEfPZEtaGyB5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM2ZNCbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHFU/p4o; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASprw2601110
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j32JpAQmHkv5QJI1PXFq4rNAG/oPOASevxwvwkrLR7k=; b=HM2ZNCbrizP+V6rT
	K92ykNusiLrfm8jMZUdZ4JM11auoxkQGBvIu1SEo2sLNp/psnkuby4kpOwahUkTm
	eGOqcehMPCAygafv+mTQb+d25B9YGdodgBQum/e/H3yaXFCGZbGXkWwaohL+TSbZ
	sN0dj+OIWWvWmHuZrw6ort7x6nBNUlTwqnNZEcLOOifwM4MCjF4A1R+25WqMFX8Z
	EnqwXL5mSXXLpyrjUO6DRxuF07QexoG8PXkYZYnxCb3fKIp6RTcM7V0MeNCbSvZ4
	XC2jfH18ABjIKjRmpSaL4cdRh1FEoyTdWzUcKqDiir3OscXsP7Sqeq6E24ah1j5c
	wlTJSw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw93be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:44:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9692160501cso92005241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782740672; x=1783345472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j32JpAQmHkv5QJI1PXFq4rNAG/oPOASevxwvwkrLR7k=;
        b=GHFU/p4oxdmVI26+0YIEUN5vqU+42rEzhjCAVMCn5gULr1whwu8ehRJXg/+RoriRyA
         CVtjkiNKNQFqwmT0mqnNWnxvdbJPUDN5Dqr3HidMunus06CQ9Vp6Z0vGH0iLkczmy0FZ
         XZ3calCb3lD81PIY/Mg2E/MyybhjFGosTmxpGNBjSlOGep6umvsJvke4uYPayz75vYfZ
         hoa+3YnBVA72Lf15BYtVbHymr5tHlinEJrpOSDw3ZhxP6AsA/ChvYmuDgAEuBR9KYYGh
         B7n0fckV0gBH2AaBiRI12VkXnwZvHW6pUb/tlVChi5s563jPmxlAu1SIXqB2G4rJpvhm
         K/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740672; x=1783345472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j32JpAQmHkv5QJI1PXFq4rNAG/oPOASevxwvwkrLR7k=;
        b=CTXPooN2lxA25+DE4vuQeaA8B0rWMVDN46O1FXcl41oy5D8PPqk2ZbOCwJMI7+OXBW
         fYasHxgGq1Sqxf9bnRnoG7XcdVHs1sIHZS91c7Qi8rI7fMxukSee0jKDqmGxxa4We7BM
         UcsBzcmh4Ab9zb04fM0r7DzDuI6daPYZYrQ+T857F0QKm1UbuotjEnrcl3k+wpPJrBTN
         GdEnFBRCmQbD7vwPr6l7vD6obzRBdGL/VJd6bTUXtgdfe6ePz/sFbfaw+X49JOH+/qHN
         PP/mvRneMd+JG4OUIQwF/kFU37hEtJaKgC/BZQxI7v2AALwsrFVVXc9Py06dyEvGI9vB
         4IRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh3Ju7+KAWz2fTbV/7rNrCKp7way9UcufUYeUQMD7Pfx1Cskf0WH5oOvyRSn0USqd99SJupNJsxgepMMCE@vger.kernel.org
X-Gm-Message-State: AOJu0YyqtjFMh1U0xiRcX9i8Zkcf+elkBpNc+ABLpiGBg9/Q69bjXlf8
	Jqut0QtfTjHqggqcinf8TXMscobUr5CKNBdaWrnEuvqDkXVNbzkgBPWlKoUOwDq64zOJzmOGrm/
	VXNv7Jtb6wELvTEpwkkI8gpoRsFzTux9cd6MkDjyphfLQ9k7TnYgPP6PnD5bDoSDRJ/+I
X-Gm-Gg: AfdE7cmKyi3uBVFEGj7XP/2nkPzoLM5r0xG9Q2k6094sfLhdSyFDBSCcIiP1ynAAFmO
	kv4V891jCyDLFbhNHT0jmKcFZ+qQ+3mHFUzDMIm7DGXVcPb6FJbhsUUBJhe9FY47OV65meuCFWN
	QUXgmw5I+xM0+d13NFbvxW+/MJTOaisbQZKNkj7gOuwHKA+jeovw/5tYLs4RO5VnjXikU7LfCdv
	KldtzEHyA8ek55dVQ5ut91OUB3QXiLGNFq27ePbSSW6JP0WN9kCveZNXDCcF9GRHUpI6mLL6+Ub
	1ma9Tfuw9RTlUNN3Qmm3UFwGmhBesQVpEhNy6wnV5r/3YOb6ts0drhi3t08XiT6L0kqlP6eT6b9
	/ghBS3zFkG+536kVPFzt7SN3eV9i5uEUu3BA=
X-Received: by 2002:a05:6102:a4a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-738b13af99bmr600902137.2.1782740672402;
        Mon, 29 Jun 2026 06:44:32 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-738b13af99bmr600879137.2.1782740671989;
        Mon, 29 Jun 2026 06:44:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm7047887a12.25.2026.06.29.06.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:44:30 -0700 (PDT)
Message-ID: <f280150f-f829-4425-a856-9ca9f7aca233@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-4-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-4-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNCBTYWx0ZWRfXznlG2Fq0YxFG
 o/yVa2nWdjlqNixRVvVGoPkXZf9ahAfagdImr+04ebfPalRegSwqDM2MKvZYGdrn5Ygn0GKeqxO
 5Bm6ZH9OMVGcpjzJ4dslJrwi/6YuZ6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNCBTYWx0ZWRfX3Sy+lb+5pXA2
 83Hq/miynJoz76RS9Ik+HQkRrO5bKBd1xyAyvxFdsvP1kyJLyHPK1F1saokaAc89zN+pyShW7RR
 Ei1Q1/B+jbfUgsnQjLlPBlZ2d8MQViilvbJ92hn+JLv3Nni2gEU3tX30TYPUQ27pLWPmgpEfeiV
 fLws4n75oLtVtdDtA/5Hn9h7JOEkMt9jd8cNwC9IPtDyEHMa6rxthSngDBwkZ6IntZdISmOmhgc
 YxIUh+JdN03+v2ybGJRlRSAASPCaNyxBJvyZXdx18xvPsXqvlwMZ3w+NnNNQxMoCn4uEgO4OP7z
 A4aKZ5Hxcb+xXsgw4fa/8m5IMQE5qM2HU2YtIXyBSEVWqeH+GmalFgK2pNBUHd2e4oua5f4sZJ5
 xHeD8vw/POI0iUrEMyTa6kseeRPM09aKJms3XrGF6xrFkkQ+bpnxAnvKJqtjrrKhNMnktoh1gy9
 5RLkxAZ0vbuN/uysxGQ==
X-Proofpoint-GUID: OZOROQf4CaK9QKR5MPKE7pBVti3DElFH
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4276c1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xfjl8YcHD3-SeSKZoCwA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: OZOROQf4CaK9QKR5MPKE7pBVti3DElFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115115-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66B916DBC93

On 6/26/26 6:32 PM, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.

[...]

>     [    0.366737] clk: Disabling unused clocks not associated with a device
>     [    0.367232] PM: genpd: Disabling unused power domains
>     [    7.791413] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
>     [    7.799702] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
>     [    8.548820] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
>     [    9.121849] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
>     [    9.121985] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
>     [    9.122691] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks

Many of these drivers only register fixed "virtual" clocks that
don't lead to any registers being altered and only exist to convey
what the clocks look like on the hw level.. but I don't think we
have great infra to skip that..

>     [    9.122760] disp_cc-sc8280xp af00000.clock-controller: clk: Disabling unused clocks
>     [    9.142121] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
>     [    9.169149] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
>     [   16.057997] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
>     [   16.058149] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
>     [   16.334879] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
>     [   16.706113] camcc-sc8280xp ad00000.clock-controller: clk: Disabling unused clocks
>     [   21.565731] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
>     [   21.597069] va_macro 3370000.codec: clk: Disabling unused clocks
>     [   21.605039] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
>     [   21.630313] wsa_macro 3240000.codec: clk: Disabling unused clocks
>     [   21.635069] tx_macro 3220000.txmacro: clk: Disabling unused clocks

This is a bit noisy, but then it's necessary for debugging the
related hangs. Maybe if it turns out to be a huge issue, we can
hide it behind a _dbg() in the future.

I was hoping/expecting that sync_state would completely replace the
late initcall (which would also simplify this diff), but I'm surprised
to learn that there's a whole bunch of clk_register(dev=NULL)
calls in the kernel (are most of them doing it for no good reason
by chance?)

Konrad

