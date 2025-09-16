Return-Path: <linux-arm-msm+bounces-73643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D1B58FA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39C6189142F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85CE1C862F;
	Tue, 16 Sep 2025 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7buFBUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E421E098
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758008984; cv=none; b=kZz8JbKeuI9MJduhjJLXgxz2sGxPW3kaiEYKup9plZ0mAInKT4TxkWT5uko6eTWEAl/3qzdsUbY7AAJEa2QA5U/vCSb0lvnvPxoJquJWuA136iw3weG5a54BVnoGZaxmdsJxf/XyqQG5i+yrt63f9jSwABXm3g3XOM0Lx9G1Czo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758008984; c=relaxed/simple;
	bh=W+Be6Ztlvx3XJs0uODHFsJYtIs4U4XmxqawnLuYcaNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9Os5fIkDfjWIonNxiCmssl9x1DXC80/i2KabjO1qH7rK9eRFLxmIJ6n0bbbYdrG8Mt6wdNS3bUbzcYDIwDyWr6IliTdArDlxFm0lZoiepj8+KcSHiwGn4My/86oIoyirDvPK5zvjJ0CYXMTnEUMoEpnprAoPSOA66n2Ryk1tiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7buFBUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pcsG013390
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RD+ta9axnzkY+q3MqSd9MuBT
	TuCWROaoN5jRYETLo/A=; b=I7buFBULgQ7+QkaIef/7yOl7UguC+gMEx0Ij5vpV
	Noh/LrnFwwOJtcf+6VAhT1I2Ma+zWJ5wCa2mlpeKUR45GfzCFteXlkm2SZijoNlq
	nmpN88Nh4gzW4+KseiaXIgZYmKOFP7QJAJyy4YBIdDWvVD3b4gMUP6NcIhH5TXoW
	u8JDn90KmJjpKdF1eb+qLmBr0anruvwnCxQyEuyb30dOVfuA+BPqS97An+Ircd6L
	iFwMRSscsmJETgBzzHdRdoGQF/eZVKMRv4q9fomluj5u6+KlMX+Y4yF7uvFZsUoB
	SGmhn5kVGk4FPdg40H93BFbupKJHiJKzzeKJql3Cod/NDQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5as1w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:49:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b52435ee30cso3475897a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 00:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758008979; x=1758613779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD+ta9axnzkY+q3MqSd9MuBTTuCWROaoN5jRYETLo/A=;
        b=cmiOcO28U3zVVlDz8gFm9DBspulBir8tCLhONmxu13la4bTvrjL31EdZd+7DZ0zKrn
         d31ESTCo+FzfNJ+G6eeyIzZTSYJoYqavcQS8VRoOkv74lduHBe0dUSE1qYkt/t/gQeEZ
         F3jx5H1JPK4ayuFqbN8TfgV4DSwy9XwAQ7B3hqNPfx+qsfAOQg8HGQHj/e63kgmBYSU/
         74qwOSPVd1Suw6nz49W1JH8bu+r2nNSGk5wpJ7lU9H5jwrvlDOy8De65mhsTVOCRGhs8
         xzE+QagxJXZGpBmjxLUSVfJtJ90/He65mrzNPlYL7CvFmp8wYk5jJ+H1+OJrWNC3dOVp
         37AA==
X-Forwarded-Encrypted: i=1; AJvYcCVOyCEPMn+Y31tDFuOIWInJAf1ZLIeowJH6j36BqX1Ca2JKDRkiGiAw3IvzSt2A6th5hGFcx1S2P1w7jYfi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8mG9cdbJeuau90FAHa+2M7kFE25QIjxF4xe2ZTWEbYCyxYByG
	I8HwTYwtunwuTRlpVtb4RT3FMLL3HNCPEf8YB3ijsJPaoI6BHs0stA6/Lr03FCI3o/3mKsICN7c
	toODeHxwNOrRRRJAfvmasC/fsNDdbvjn6VX61FFpxjtzMlNZh/W7Pp9lb9gr3pHbGxrCz
X-Gm-Gg: ASbGncuwvvA+yVLchnK4iq73q+cy1+qlASP1te6sl9BTuL+4tBXEQmBVI6prN+iNhfY
	aFa9rGPuAWV6Qar52uSkXsyim+NjAKl8ZUMF4NNtQu7h802PrfJKujWz49PYl/agNoLGITRjc0c
	rLMM2PLSR0HiHorAlaCCZ6fH5wsNHvCGx3HUiNdf6eoBlZDOWJ+cHGTZ87BPsd45GHGYFWNgVjf
	b5SI6sWw3f7yPRAQ3CrHvmggrz1X/XiQQ2TlFd8XiytFb65mFIU9XSu+OrFqNYwd/LBDseqb0PD
	1TDk95SQXMGSjstLdYlbcraX4zxyXl/CqwhrpXFumUHVyi+641jtxdWKkRHiyVOfHwU=
X-Received: by 2002:a05:6a20:258a:b0:249:d4b0:5b2c with SMTP id adf61e73a8af0-2602aa8a4d8mr21370481637.14.1758008979093;
        Tue, 16 Sep 2025 00:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwdeHuLtMjTN5imzmMBdIsYKSIeC/AVXoqz2e7UTSBmIIvssIp5vod3+KGhF2DpoYErJqm1A==
X-Received: by 2002:a05:6a20:258a:b0:249:d4b0:5b2c with SMTP id adf61e73a8af0-2602aa8a4d8mr21370433637.14.1758008978380;
        Tue, 16 Sep 2025 00:49:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7762c225d2asm9332136b3a.65.2025.09.16.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:49:38 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:19:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
        pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net,
        david@redhat.com, mhocko@suse.com, tudor.ambarus@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
Message-ID: <20250916074929.xiait75tbnbyjt4c@hu-mojha-hyd.qualcomm.com>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
X-Proofpoint-GUID: 5JILhgMbig9ccp-sxHT6TprKMNqJZhY-
X-Proofpoint-ORIG-GUID: 5JILhgMbig9ccp-sxHT6TprKMNqJZhY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX7hOFvUg6SrIH
 Amez21YrjxdsDJweHBKVn5/aSNQ3K0uc+uoiI+E+A8KHcgtwJhvVVBLxB2aeGI+5LKg3ThhZgI3
 grAaiV2BTyqjs5HBHWjFTTSZ1XtqTh+f03XbpkuP5wYubZquXwuIFYsa0ztq1/0a97Yf0z7SPmp
 DpbXzSirHIsDo8w/A5GNieKBQszk6g0co77b1D8/wZTf+LDRghylvX+CfZT8L/SYFzX75CwFkXw
 0M3AE1gpRGCiOvs0jobCY82I42ZmKIPK60f4XTIpAtMUbDGIEmr0M1/nW1ExerANZljxPhWk6oO
 2YOp/ygpq5sJfhmzSO6sZ2+rdocljSuZpACbapTeEZ7urV0fhFz1VfvOwyk5VuJCpKzudc6sG7A
 vcgMNcVB
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c91695 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=vnREMb7VAAAA:8 a=COk6AnOGAAAA:8 a=bLXd17yOAAAA:8
 a=1XWaLZrsAAAA:8 a=349LBZSuyFQcu3wEsZwA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=7KeoIwV6GZqOttXkcoxL:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XOuVWTVwyKTMzSnUH6Op:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010

On Fri, Sep 12, 2025 at 06:08:39PM +0300, Eugen Hristev wrote:
> kmemdump is a mechanism which allows the kernel to mark specific memory
> areas for dumping or specific backend usage.
> Once regions are marked, kmemdump keeps an internal list with the regions
> and registers them in the backend.
> Further, depending on the backend driver, these regions can be dumped using
> firmware or different hardware block.
> Regions being marked beforehand, when the system is up and running, there
> is no need nor dependency on a panic handler, or a working kernel that can
> dump the debug information.
> The kmemdump approach works when pstore, kdump, or another mechanism do not.
> Pstore relies on persistent storage, a dedicated RAM area or flash, which
> has the disadvantage of having the memory reserved all the time, or another
> specific non volatile memory. Some devices cannot keep the RAM contents on
> reboot so ramoops does not work. Some devices do not allow kexec to run
> another kernel to debug the crashed one.
> For such devices, that have another mechanism to help debugging, like
> firmware, kmemdump is a viable solution.
> 
> kmemdump can create a core image, similar with /proc/vmcore, with only
> the registered regions included. This can be loaded into crash tool/gdb and
> analyzed.
> To have this working, specific information from the kernel is registered,
> and this is done at kmemdump init time, no need for the kmemdump user to
> do anything.
> 
> This version of the kmemdump patch series includes two backend drivers:
> one is the Qualcomm Minidump backend, and the other one is the Debug Kinfo
> backend for Android devices, reworked from this source here:
> https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
> written originally by Jone Chou <jonechou@google.com>

+Adding some pstore experts to bring this to their attention if this can
be followed and if they find it useful.

Is not a good idea to add pstore as one of the backend of kmemdump so that all
the kmemdump captured data automatically flow in a separate record(section) in
pstore(e.g.,ram) so that all user of pstore automatically benefit from kmemdump
captured data and later kmemdump section from ramoops can be recovered from
userspace in next boot and crash utility can be run on that.

              kmemdump captured data
                |
       ---------------------
       |                   |
       V                   V
   Vendors firmware      pstore(ram)
    backend               backend
    (minidump)


Thanks,
-Mukesh

> 
> *** History, motivation and available online resources ***
> 
> Initial version of kmemdump and discussion is available here:
> https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
> 
> Kmemdump has been presented and discussed at Linaro Connect 2025,
> including motivation, scope, usability and feasability.
> Video of the recording is available here for anyone interested:
> https://www.youtube.com/watch?v=r4gII7MX9zQ&list=PLKZSArYQptsODycGiE0XZdVovzAwYNwtK&index=14
> 
> Linaro blog on kmemdump can be found here:
> https://www.linaro.org/blog/introduction-to-kmemdump/
> 
> The implementation is based on the initial Pstore/directly mapped zones
> published as an RFC here:
> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
> 
> The back-end implementation for qcom_minidump is based on the minidump
> patch series and driver written by Mukesh Ojha, thanks:
> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
> 
> The RFC v2 version with .section creation and macro annotation kmemdump
> is available here:
> https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> 
> *** How to use kmemdump with minidump backend on Qualcomm platform guide ***
> 
> Prerequisites:
> Crash tool compiled with target=ARM64 and minor changes required for usual crash
> mode (minimal mode works without the patch)
> A patch can be applied from here https://p.calebs.dev/49a048
> This patch will be eventually sent in a reworked way to crash tool.
> 
> Target kernel must be built with :
> CONFIG_DEBUG_INFO_REDUCED=n ; this will have vmlinux include all the debugging
> information needed for crash tool.
> 
> Also, the kernel requires these as well:
> CONFIG_KMEMDUMP, CONFIG_KMEMDUMP_COREIMAGE, and the backend
> CONFIG_KMEMDUMP_QCOM_MINIDUMP_BACKEND
> 
> Kernel arguments:
> Kernel firmware must be set to mode 'mini' by kernel module parameter
> like this : qcom_scm.download_mode=mini
> 
> After the kernel boots, and qcom_minidump module is loaded, everything is ready for
> a possible crash.
> 
> Once the crash happens, the firmware will kick in and you will see on
> the console the message saying Sahara init, etc, that the firmware is
> waiting in download mode. (this is subject to firmware supporting this
> mode, I am using sa8775p-ride board)
> 
> Example of log on the console:
> "
> [...]
> B -   1096414 - usb: init start
> B -   1100287 - usb: qusb_dci_platform , 0x19
> B -   1105686 - usb: usb3phy: PRIM success: lane_A , 0x60
> B -   1107455 - usb: usb2phy: PRIM success , 0x4
> B -   1112670 - usb: dci, chgr_type_det_err
> B -   1117154 - usb: ID:0x260, value: 0x4
> B -   1121942 - usb: ID:0x108, value: 0x1d90
> B -   1124992 - usb: timer_start , 0x4c4b40
> B -   1129140 - usb: vbus_det_pm_unavail
> B -   1133136 - usb: ID:0x252, value: 0x4
> B -   1148874 - usb: SUPER , 0x900e
> B -   1275510 - usb: SUPER , 0x900e
> B -   1388970 - usb: ID:0x20d, value: 0x0
> B -   1411113 - usb: ENUM success
> B -   1411113 - Sahara Init
> B -   1414285 - Sahara Open
> "
> 
> Once the board is in download mode, you can use the qdl tool (I
> personally use edl , have not tried qdl yet), to get all the regions as
> separate files.
> The tool from the host computer will list the regions in the order they
> were downloaded.
> 
> Once you have all the files simply use `cat` to put them all together,
> in the order of the indexes.
> For my kernel config and setup, here is my cat command : (you can use a script
> or something, I haven't done that so far):
> 
> `cat memory/md_KELF1.BIN memory/md_Kvmcorein2.BIN memory/md_Kconfig3.BIN \
> memory/md_Kmemsect4.BIN memory/md_Ktotalram5.BIN memory/md_Kcpu_poss6.BIN \
> memory/md_Kcpu_pres7.BIN memory/md_Kcpu_onli8.BIN memory/md_Kcpu_acti9.BIN \
> memory/md_Kjiffies10.BIN memory/md_Klinux_ba11.BIN memory/md_Knr_threa12.BIN \
> memory/md_Knr_irqs13.BIN memory/md_Ktainted_14.BIN memory/md_Ktaint_fl15.BIN \
> memory/md_Kmem_sect16.BIN memory/md_Knode_dat17.BIN memory/md_Knode_sta18.BIN \
> memory/md_K__per_cp19.BIN memory/md_Knr_swapf20.BIN memory/md_Kinit_uts21.BIN \
> memory/md_Kprintk_r22.BIN memory/md_Kprintk_r23.BIN memory/md_Kprb24.BIN \
> memory/md_Kprb_desc25.BIN memory/md_Kprb_info26.BIN memory/md_Kprb_data27.BIN \
> memory/md_Krunqueue28.BIN memory/md_Khigh_mem29.BIN memory/md_Kinit_mm30.BIN \
> memory/md_Kinit_mm_31.BIN memory/md_Kunknown32.BIN memory/md_Kunknown33.BIN \
> memory/md_Kunknown34.BIN  memory/md_Kunknown35.BIN memory/md_Kunknown36.BIN \
> memory/md_Kunknown37.BIN memory/md_Kunknown38.BIN memory/md_Kunknown39.BIN \
> memory/md_Kunknown40.BIN memory/md_Kunknown41.BIN memory/md_Kunknown42.BIN \
> memory/md_Kunknown43.BIN memory/md_Kunknown44.BIN memory/md_Kunknown45.BIN \
> memory/md_Kunknown46.BIN memory/md_Kunknown49.BIN  memory/md_Kunknown50.BIN \
> memory/md_Kunknown51.BIN > ~/minidump_image`
> 
> Once you have the resulted file, use `crash` tool to load it, like this:
> `./crash --no_modules --no_panic --no_kmem_cache --zero_excluded vmlinux minidump_image`
> 
> There is also a --minimal mode for ./crash that would work without any patch applied
> to crash tool, but you can't inspect symbols, etc.
> 
> Once you load crash you will see something like this :
> 
>       KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
>     DUMPFILE: /home/eugen/new
>         CPUS: 8 [OFFLINE: 5]
>         DATE: Thu Jan  1 02:00:00 EET 1970
>       UPTIME: 00:00:22
>        TASKS: 0
>     NODENAME: qemuarm64
>      RELEASE: 6.17.0-rc5-next-20250910-00020-g7dfa02aeae7e
>      VERSION: #116 SMP PREEMPT Thu Sep 11 18:28:06 EEST 2025
>      MACHINE: aarch64  (unknown Mhz)
>       MEMORY: 34.2 GB
>        PANIC: ""
> crash> log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
> [    0.000000] Linux version 6.17.0-rc5-next-20250910-00020-g7dfa02aeae7e (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #116 SMP PREEMPT Thu Sep 11 18:28:06 EEST 2025
> 
> 
> *** Debug Kinfo backend driver ***
> I don't have any device to actually test this. So I have not.
> I hacked the driver to just use a kmalloc'ed area to save things instead
> of the shared memory, and dumped everything there and checked whether it is identical
> with what the downstream driver would have saved.
> So this synthetic test passed and memories are identical.
> Anyone who actually wants to test this, feel free to reply to the patch.
> I have also written a simple DT binding for the driver.
> 
> Thanks for everyone reviewing and bringing ideas into the discussion.
> 
> Eugen
> 
> Changelog since the v2 of the RFC:
> - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> - Removed the .section as requested by David Hildenbrand.
> - Moved all kmemdump registration(when possible) to vmcoreinfo.
> - Because of this, some of the variables that I was registering had to be non-static
> so I had to modify this as per David Hildenbrand suggestion.
> - Fixed minor things in the Kinfo driver: one field was broken, fixed some
> compiler warnings, fixed the copyright and remove some useless includes.
> - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
> and it's now available in kernel hacking, as per Randy Dunlap review
> - Reworked some of the Documentation as per review from Jon Corbet
> 
> 
> Changelog since the v1 of the RFC:
> - V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
> - Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
> This means new API, macros, new way to store the regions inside kmemdump
> (ditched the IDR, moved to static allocation, have a static default backend, etc)
> - Reworked qcom_minidump driver based on review from Bjorn Andersson
> - Reworked printk log buffer registration based on review from Petr Mladek
> 
> I appologize if I missed any review comments. I know there is still lots of work
> on this series and hope I will improve it more and more.
> Patches are sent on top of next-20250910
> 
> Eugen Hristev (16):
>   kmemdump: Introduce kmemdump
>   Documentation: Add kmemdump
>   kmemdump: Add coreimage ELF layer
>   Documentation: kmemdump: Add section for coreimage ELF
>   kernel/vmcore_info: Register dynamic information into Kmemdump
>   kmemdump: Introduce qcom-minidump backend driver
>   soc: qcom: smem: Add minidump device
>   init/version: Add banner_len to save banner length
>   genirq/irqdesc: Have nr_irqs as non-static
>   panic: Have tainted_mask as non-static
>   mm/swapfile: Have nr_swapfiles as non-static
>   printk: Register information into Kmemdump
>   sched: Add sched_get_runqueues_area
>   kernel/vmcoreinfo: Register kmemdump core image information
>   kmemdump: Add Kinfo backend driver
>   dt-bindings: Add Google Kinfo
> 
>  Documentation/dev-tools/index.rst             |   1 +
>  Documentation/dev-tools/kmemdump.rst          | 139 +++++++
>  .../bindings/misc/google,kinfo.yaml           |  36 ++
>  MAINTAINERS                                   |  19 +
>  drivers/soc/qcom/smem.c                       |  10 +
>  include/linux/kmemdump.h                      | 130 +++++++
>  include/linux/printk.h                        |   1 +
>  init/version-timestamp.c                      |   1 +
>  init/version.c                                |   1 +
>  kernel/irq/irqdesc.c                          |   2 +-
>  kernel/panic.c                                |   2 +-
>  kernel/printk/printk.c                        |  47 +++
>  kernel/sched/core.c                           |  15 +
>  kernel/sched/sched.h                          |   2 +
>  kernel/vmcore_info.c                          | 149 ++++++++
>  mm/Kconfig.debug                              |   2 +
>  mm/Makefile                                   |   1 +
>  mm/kmemdump/Kconfig.debug                     |  53 +++
>  mm/kmemdump/Makefile                          |   6 +
>  mm/kmemdump/kinfo.c                           | 293 +++++++++++++++
>  mm/kmemdump/kmemdump.c                        | 234 ++++++++++++
>  mm/kmemdump/kmemdump_coreimage.c              | 222 +++++++++++
>  mm/kmemdump/qcom_minidump.c                   | 353 ++++++++++++++++++
>  mm/swapfile.c                                 |   2 +-
>  24 files changed, 1718 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/dev-tools/kmemdump.rst
>  create mode 100644 Documentation/devicetree/bindings/misc/google,kinfo.yaml
>  create mode 100644 include/linux/kmemdump.h
>  create mode 100644 mm/kmemdump/Kconfig.debug
>  create mode 100644 mm/kmemdump/Makefile
>  create mode 100644 mm/kmemdump/kinfo.c
>  create mode 100644 mm/kmemdump/kmemdump.c
>  create mode 100644 mm/kmemdump/kmemdump_coreimage.c
>  create mode 100644 mm/kmemdump/qcom_minidump.c
> 
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha

