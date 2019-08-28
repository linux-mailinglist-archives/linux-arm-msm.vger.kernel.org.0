Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917BC9FDE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 11:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfH1JJH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 05:09:07 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46764 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbfH1JJG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 05:09:06 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 3823F205F8;
        Wed, 28 Aug 2019 11:09:03 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 13E812018B;
        Wed, 28 Aug 2019 11:09:03 +0200 (CEST)
To:     SCSI <linux-scsi@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Cc:     Avri Altman <avri.altman@wdc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Nikita Shvets <runetmember@gmail.com>,
        Stanley Chu <stanley.chu@mediatek.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: ufshcd_abort: Device abort task at tag 7
Message-ID: <9f3ed253-5f6b-1893-531d-085f881956dd@free.fr>
Date:   Wed, 28 Aug 2019 11:09:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Aug 28 11:09:03 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Someone posted a bug report for UFS on an sdm850 tablet:
https://bugzilla.kernel.org/show_bug.cgi?id=204685

If I'm reading the boot logs right, this board is EFI rather than DT.
(Lee: EFI on qcom is one of your areas, right?
The UFSHC driver is DT-aware, but is it EFI-aware?)

[    0.000000] efi: memattr: Unexpected EFI Memory Attributes table version -1347440721
I suppose this may be safely ignored?

[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.2.0-99-generic root=UUID=66e85825-5c21-4120-b4ee-e17e4cdc1e58 ro efi=novamap ignore_loglevel clk_ignore_unused pd_ignore_unused console=tty0
IIUC, the kernel is supposed to boot successfully even without
"clk_ignore_unused pd_ignore_unused" (tangential, unrelated)

Bjorn, any ideas? Ever see this issue?

Regards.


Notable events:

[    2.438780] geni_se_qup 8c0000.geniqup: Err getting AHB clks -517
[    2.439030] geni_se_qup ac0000.geniqup: Err getting AHB clks -517

[    2.453050] ufshcd-qcom 1d84000.ufshc: ufshcd_get_vreg: vcc get failed, err=-517
[    2.458477] ufshcd-qcom 1d84000.ufshc: Initialization failed

[    2.540980] ufshcd-qcom 1d84000.ufshc: ufs_qcom_init: required phy device. hasn't probed yet. err = -517
[    2.540986] ufshcd-qcom 1d84000.ufshc: ufshcd_variant_hba_init: variant qcom init failed err -517
[    2.541052] ufshcd-qcom 1d84000.ufshc: Initialization failed

[    2.695052] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
[    2.699182] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vccq-supply regulator, assuming enabled
[    2.706287] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
[    2.866207] ufshcd-qcom 1d84000.ufshc: ufshcd_find_max_sup_active_icc_level: Regulator capability was not set, actvIccLevel=0

[   33.772190] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 7
[   33.774946] sd 0:0:0:5: [sdf] tag#7 CDB: Read(10) 28 00 00 00 00 00 00 00 01 00
[   33.805525] ufshcd-qcom 1d84000.ufshc: hba->ufs_version = 0x210, hba->capabilities = 0x1587031f
[   33.808338] ufshcd-qcom 1d84000.ufshc: hba->outstanding_reqs = 0xab000080, hba->outstanding_tasks = 0x0

[   34.045961] ufshcd-qcom 1d84000.ufshc: UPIU[7] - issue time 3165714 us
[   34.047069] ufshcd-qcom 1d84000.ufshc: UPIU[7] - complete time 0 us
[   34.048196] ufshcd-qcom 1d84000.ufshc: UPIU[7] - Transfer Request Descriptor phys@0x2661cd0e0
[   34.051799] ufshcd-qcom 1d84000.ufshc: UPIU[7] - Request UPIU phys@0xdf045400
[   34.055715] ufshcd-qcom 1d84000.ufshc: UPIU[7] - Response UPIU phys@0xdf045600
[   34.062761] ufshcd-qcom 1d84000.ufshc: UPIU[7] - PRDT - 1 entries  phys@0xdf045800
[   34.065836] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: cmd pending in the device. tag = 7
[   34.168171] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x01 timed-out
[   34.169822] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: failed with err -110
[   34.171497] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 29
[   34.174951] ufshcd-qcom 1d84000.ufshc: UPIU[29] - issue time 3036529 us
[   34.176740] ufshcd-qcom 1d84000.ufshc: UPIU[29] - complete time 0 us
[   34.178534] ufshcd-qcom 1d84000.ufshc: UPIU[29] - Transfer Request Descriptor phys@0x2661cd3a0
[   34.184172] ufshcd-qcom 1d84000.ufshc: UPIU[29] - Request UPIU phys@0xdf055c00
[   34.190105] ufshcd-qcom 1d84000.ufshc: UPIU[29] - Response UPIU phys@0xdf055e00
[   34.200535] ufshcd-qcom 1d84000.ufshc: UPIU[29] - PRDT - 1 entries  phys@0xdf056000
[   34.202707] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: failed with err -5
[   34.204910] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 25
[   34.209414] ufshcd-qcom 1d84000.ufshc: UPIU[25] - issue time 3017240 us
[   34.211722] ufshcd-qcom 1d84000.ufshc: UPIU[25] - complete time 0 us
[   34.214048] ufshcd-qcom 1d84000.ufshc: UPIU[25] - Transfer Request Descriptor phys@0x2661cd320
[   34.221259] ufshcd-qcom 1d84000.ufshc: UPIU[25] - Request UPIU phys@0xdf052c00
[   34.228788] ufshcd-qcom 1d84000.ufshc: UPIU[25] - Response UPIU phys@0xdf052e00
[   34.241869] ufshcd-qcom 1d84000.ufshc: UPIU[25] - PRDT - 1 entries  phys@0xdf053000
[   34.244578] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: failed with err -5
[   34.247307] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 24
[   34.252877] ufshcd-qcom 1d84000.ufshc: UPIU[24] - issue time 3018666 us
[   34.255718] ufshcd-qcom 1d84000.ufshc: UPIU[24] - complete time 0 us
[   34.258540] ufshcd-qcom 1d84000.ufshc: UPIU[24] - Transfer Request Descriptor phys@0x2661cd300
[   34.266987] ufshcd-qcom 1d84000.ufshc: UPIU[24] - Request UPIU phys@0xdf052000
[   34.275500] ufshcd-qcom 1d84000.ufshc: UPIU[24] - Response UPIU phys@0xdf052200
[   34.289559] ufshcd-qcom 1d84000.ufshc: UPIU[24] - PRDT - 1 entries  phys@0xdf052400
[   34.292343] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: failed with err -5
[   34.295114] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 27
[   34.300650] ufshcd-qcom 1d84000.ufshc: UPIU[27] - issue time 3040502 us
[   34.303419] ufshcd-qcom 1d84000.ufshc: UPIU[27] - complete time 0 us
[   34.306159] ufshcd-qcom 1d84000.ufshc: UPIU[27] - Transfer Request Descriptor phys@0x2661cd360
[   34.314450] ufshcd-qcom 1d84000.ufshc: UPIU[27] - Request UPIU phys@0xdf054400
[   34.322892] ufshcd-qcom 1d84000.ufshc: UPIU[27] - Response UPIU phys@0xdf054600
[   34.336707] ufshcd-qcom 1d84000.ufshc: UPIU[27] - PRDT - 1 entries  phys@0xdf054800
[   34.339447] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: failed with err -5
[   34.342173] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 31
[   34.347604] ufshcd-qcom 1d84000.ufshc: UPIU[31] - issue time 3036762 us
[   34.350345] ufshcd-qcom 1d84000.ufshc: UPIU[31] - complete time 0 us
[   34.353042] ufshcd-qcom 1d84000.ufshc: UPIU[31] - Transfer Request Descriptor phys@0x2661cd3e0
[   34.361194] ufshcd-qcom 1d84000.ufshc: UPIU[31] - Request UPIU phys@0xdf057400
[   34.369347] ufshcd-qcom 1d84000.ufshc: UPIU[31] - Response UPIU phys@0xdf057600
[   34.383041] ufshcd-qcom 1d84000.ufshc: UPIU[31] - PRDT - 1 entries  phys@0xdf057800
[   34.385789] ufshcd-qcom 1d84000.ufshc: ufshcd_abort: failed with err -5
[   34.508188] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x08 timed-out
[   34.511533] ufshcd-qcom 1d84000.ufshc: ufshcd_eh_device_reset_handler: failed with err -110
[   34.616170] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x08 timed-out
[   34.619542] ufshcd-qcom 1d84000.ufshc: ufshcd_eh_device_reset_handler: failed with err -110
[   34.724170] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x08 timed-out
[   34.727563] ufshcd-qcom 1d84000.ufshc: ufshcd_eh_device_reset_handler: failed with err -110
[   34.832169] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x08 timed-out
[   34.835539] ufshcd-qcom 1d84000.ufshc: ufshcd_eh_device_reset_handler: failed with err -110
[   34.940170] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x08 timed-out
[   34.943576] ufshcd-qcom 1d84000.ufshc: ufshcd_eh_device_reset_handler: failed with err -110
[   35.048171] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x08 timed-out
[   35.051618] ufshcd-qcom 1d84000.ufshc: ufshcd_eh_device_reset_handler: failed with err -110
[   35.095792] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX, TX]: gear=[1, 1], lane[1, 1], pwr[SLOWAUTO_MODE, SLOWAUTO_MODE], rate = 0
[   35.099829] ufshcd-qcom 1d84000.ufshc: UPIU[7] - issue time 3165714 us
[   35.103402] ufshcd-qcom 1d84000.ufshc: UPIU[7] - complete time 0 us
[   35.106937] ufshcd-qcom 1d84000.ufshc: UPIU[7] - Transfer Request Descriptor phys@0x2661cd0e0
[   35.117587] ufshcd-qcom 1d84000.ufshc: UPIU[7] - Request UPIU phys@0xdf045400
[   35.128237] ufshcd-qcom 1d84000.ufshc: UPIU[7] - Response UPIU phys@0xdf045600
[   35.145785] ufshcd-qcom 1d84000.ufshc: UPIU[7] - PRDT - 1 entries  phys@0xdf045800
[   35.152773] ufshcd-qcom 1d84000.ufshc: UPIU[24] - issue time 3018666 us
[   35.156346] ufshcd-qcom 1d84000.ufshc: UPIU[24] - complete time 0 us
[   35.159906] ufshcd-qcom 1d84000.ufshc: UPIU[24] - Transfer Request Descriptor phys@0x2661cd300
[   35.170605] ufshcd-qcom 1d84000.ufshc: UPIU[24] - Request UPIU phys@0xdf052000
[   35.181279] ufshcd-qcom 1d84000.ufshc: UPIU[24] - Response UPIU phys@0xdf052200
[   35.198877] ufshcd-qcom 1d84000.ufshc: UPIU[24] - PRDT - 1 entries  phys@0xdf052400
[   35.205904] ufshcd-qcom 1d84000.ufshc: UPIU[25] - issue time 3017240 us
[   35.209398] ufshcd-qcom 1d84000.ufshc: UPIU[25] - complete time 0 us
[   35.212913] ufshcd-qcom 1d84000.ufshc: UPIU[25] - Transfer Request Descriptor phys@0x2661cd320
[   35.223656] ufshcd-qcom 1d84000.ufshc: UPIU[25] - Request UPIU phys@0xdf052c00
[   35.234408] ufshcd-qcom 1d84000.ufshc: UPIU[25] - Response UPIU phys@0xdf052e00
[   35.252106] ufshcd-qcom 1d84000.ufshc: UPIU[25] - PRDT - 1 entries  phys@0xdf053000
[   35.259137] ufshcd-qcom 1d84000.ufshc: UPIU[27] - issue time 3040502 us
[   35.262691] ufshcd-qcom 1d84000.ufshc: UPIU[27] - complete time 0 us
[   35.266202] ufshcd-qcom 1d84000.ufshc: UPIU[27] - Transfer Request Descriptor phys@0x2661cd360
[   35.276857] ufshcd-qcom 1d84000.ufshc: UPIU[27] - Request UPIU phys@0xdf054400
[   35.287652] ufshcd-qcom 1d84000.ufshc: UPIU[27] - Response UPIU phys@0xdf054600
[   35.305317] ufshcd-qcom 1d84000.ufshc: UPIU[27] - PRDT - 1 entries  phys@0xdf054800
[   35.312298] ufshcd-qcom 1d84000.ufshc: UPIU[29] - issue time 3036529 us
[   35.315788] ufshcd-qcom 1d84000.ufshc: UPIU[29] - complete time 0 us
[   35.319240] ufshcd-qcom 1d84000.ufshc: UPIU[29] - Transfer Request Descriptor phys@0x2661cd3a0
[   35.329591] ufshcd-qcom 1d84000.ufshc: UPIU[29] - Request UPIU phys@0xdf055c00
[   35.339727] ufshcd-qcom 1d84000.ufshc: UPIU[29] - Response UPIU phys@0xdf055e00
[   35.356361] ufshcd-qcom 1d84000.ufshc: UPIU[29] - PRDT - 1 entries  phys@0xdf056000
[   35.363009] ufshcd-qcom 1d84000.ufshc: UPIU[31] - issue time 3036762 us
[   35.366321] ufshcd-qcom 1d84000.ufshc: UPIU[31] - complete time 0 us
[   35.369646] ufshcd-qcom 1d84000.ufshc: UPIU[31] - Transfer Request Descriptor phys@0x2661cd3e0
[   35.379815] ufshcd-qcom 1d84000.ufshc: UPIU[31] - Request UPIU phys@0xdf057400
[   35.389919] ufshcd-qcom 1d84000.ufshc: UPIU[31] - Response UPIU phys@0xdf057600
[   35.406573] ufshcd-qcom 1d84000.ufshc: UPIU[31] - PRDT - 1 entries  phys@0xdf057800
[   35.506995] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX, TX]: gear=[3, 3], lane[2, 2], pwr[FAST MODE, FAST MODE], rate = 2
