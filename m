Return-Path: <linux-arm-msm+bounces-74063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE996B83F6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 12:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE3F4A602A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 10:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2192F26FA6F;
	Thu, 18 Sep 2025 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHFidj9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE624167F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758190047; cv=none; b=Xrp2ll3QlIglo/580I1JOM2+yiCng4rm6JbvYDiuvbZh7tZCIyZ/5yH3L1R5aZiZ+/iYWpYs2zwMM1llMxo7iSZqRSpKLCVeukNjes0GiqF7b89F8j7B2IZAdcNbFTL3xKdaX586KVHm478ILWuNqijnYswg2iD0zL4i5nWoGBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758190047; c=relaxed/simple;
	bh=MaHkjJYwc8DMck7Xh9rwkZqfWOJBacfKsQYBgtQ+Umc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=napGhMwjRXdW75v9eI4DS+PBBks2Lmh1/+AOP5G3fxJU8prxoycUVIHitXKqbjElpPJg+toVRw1OY+McQtthoaBlh/PYlijmIxErXeCPYeUlziLGWKHwJza7yZlDtBrWl0iSHsBLEgWyzg5y34Woo3pUoFoo332sWOYT++bBvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHFidj9d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I6g9UY021854
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGOSNQ5nH47a+34ZmsmhGV0lPGcs11aQrS/2w7Sf1xk=; b=UHFidj9dVpLlZODi
	nDLsX2J00guAzO1R6kpuayxmCkoVrL679n2MCP7Ok8v+JzUkRjtFd2gB9vAfpEsx
	6jQ3khsk1Ce7wqK8w45V19ae8DBzNHOfClxu9fMXKjErjO1MwHnIoR3ew73HktPy
	bA0TMvb7Ta6w23VRpG6VzbQb74z0D3CeLVC231nZJo9x8y8pdv0t15BSnYw4/eZN
	UM7i88Xn0UG6G+cRcisvxz3qsNIHXzoH/67dYMSgwFmIf5Dksim0qWyuXXP7Ukh1
	uxqz8hWgTVcvCxuTkOHXPSfZmpiV82UCo0wNbYLkTyc4KPUDsDb9wgNyY/74Ef9Q
	fGElTg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxwusy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:07:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79538b281cdso4911096d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758190043; x=1758794843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGOSNQ5nH47a+34ZmsmhGV0lPGcs11aQrS/2w7Sf1xk=;
        b=nbACUvW1KvLv1F3qtEet8yqP/WDl+0qhFld/58FO7lzO0DZAZAvLhXk3EuJNKiiCJn
         K1WFy/QaO/KoQxW7NAZuydCYpzM5nBdCSmdsHIBrZGKBFAhQeBUWhcg2Ec8Bn2K9EJM7
         JefBgXWpGDMXms8nJ67pIQv909nEzt151Jmgy1Q/ABeTSHVcSosfkPWT0sDyGQ4g8PrZ
         6f5s/QQzDeqZKW2Z8drTIz6yIOnLRiV5+GEtchnoMa05nJGctk09woxpjdvQF01zMG4g
         FkY65GiXuPEdjxvHgDnqLR/0/FbqAXJIPoRErgVLJEzhXT4X4WsWZtn6VqFUk6JPPW5b
         C3lw==
X-Forwarded-Encrypted: i=1; AJvYcCXqNOjCa3arrxlXkmpNCfgJAqoVXKfnWH5GMENRjfoyYiAkGEgNXjj9tiDtbUBLr2rXdBEsm6fAFt1dOiQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwIQV7ktiucFtWr4XYcTAPPzouPAtoZYBANIYVET9wq2paNJfM1
	eMnjuSfTE9Z0deEaGfJVWqwkY10X4QORuZC2ikh5SfjDHx0g5oXvu7uVEvO9JXU6GXO8Oirva/t
	j1rzXM6NPadkJwa6pcOLejgZUcFM8CdUIwJN4CTByA4qSpL2n+a4UubAaxp9x8eVs8kG4
X-Gm-Gg: ASbGncttOPI6EnRLYOI7PhQzFylFYIyJjEE2/8QhXJQNSKmZJAqcFB5KEcihbMSCz48
	Yn4ULVDf+vekIxJYsngM33kxfFOOrLWcyz+C4fWXwuQuCIh79B7PWYw5rHH5m/i9F1PL61iAxVg
	wPNA0Yy5ow4bnihZDIplQhSkg0eZfK1jsKz6EKuJGfPFhu4OAjCz6D6CghvNhIZkZKeSyAAwcSN
	fQmpBE6+ud0k8NJBfdN1mVkEqOlPSFeDCo8ikHaLZ993gMmQ4KH8NXwkzyynyOGN0YqfRflEPj9
	Xo7NPJV9sRvTitG9TqyF25x3/yHeprHA4DH2YTwa8L8uhN6cIImigsJDWAYVDZqDN2gAzJhb9gU
	=
X-Received: by 2002:ad4:5fca:0:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-7927b757c00mr27753856d6.30.1758190042414;
        Thu, 18 Sep 2025 03:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFBEfjc7Tkt/1Iv7IF+XCof1OPXKA6VZBfDMdHjBqN0oeH0J4tmyEMtrM4m9cQn6cz5NMfNg==
X-Received: by 2002:ad4:5fca:0:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-7927b757c00mr27753456d6.30.1758190041748;
        Thu, 18 Sep 2025 03:07:21 -0700 (PDT)
Received: from trex (152.red-79-144-196.dynamicip.rima-tde.net. [79.144.196.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e754140sm73363605e9.21.2025.09.18.03.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 03:07:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 18 Sep 2025 12:07:19 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime
 resume
Message-ID: <aMvZ10EsMif/DOP4@trex>
References: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
 <dab18f70-4017-4c06-92c1-91cfd2229540@kernel.org>
 <8e2781ae-34d2-4009-bf8c-56aa1bb6fe85@oss.qualcomm.com>
 <aMuz/C1iT8JtjXbQ@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMuz/C1iT8JtjXbQ@trex>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7fL0Ho8JbdK/
 l66yeZJbGiiw7Gv+EQgDdFcp/75BWCSEnPD4crmYtf0aUlO+wVwmT1Ll640WmXjliRHEwmX3ZRH
 m5jl7RiCYGEyKIl8AcQunzSxAYhuoI5W79/fBSeJLwl5FqqQgykCgFTI2b6HRIFSnG2/yuJljXI
 uBb+vaTRwsu4quGcOf7hRv9Y9sKXfSU3DxFQmE6elpn/ne9+EDB3254uzc2y9b7DtijBVSoKNrZ
 fsnjkycsR8SQvfgZkuSVHy/JiuNekcVFwkz4WFKxzs1mtpSdmh+Qq2heo+ONULESk9LLhTDrC8S
 dEkNDWvc198cK0o85S1qiFfji2ZYCN4j+GbYw4Nsefg6JVg+UzCoQrfSJh2aVPjgVUkrK9gJvLH
 eOZIR62T
X-Proofpoint-ORIG-GUID: SoyuI9IASEyn0_-nRUAumhWg3t2xo48O
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cbd9dc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=UlsMzGb/nx+Jy78HFkoo8g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=UD1JcZfzldWnGte6AesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SoyuI9IASEyn0_-nRUAumhWg3t2xo48O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 18/09/25 09:25:48, Jorge Ramirez wrote:
> On 18/09/25 09:25:53, Praveen Talari wrote:
> > Hi Krzysztof,
> > 
> > On 9/18/2025 5:28 AM, Krzysztof Kozlowski wrote:
> > > On 18/09/2025 03:51, Praveen Talari wrote:
> > > > A stall was observed in disable_irq() during
> > > > pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
> > > > while the UART port was not yet active. This led to a hang in
> > > > __synchronize_irq(), as shown in the following trace:
> > > > 
> > > > Call trace:
> > > >      __switch_to+0xe0/0x120
> > > >      __schedule+0x39c/0x978
> > > >      schedule+0x5c/0xf8
> > > >      __synchronize_irq+0x88/0xb4
> > > >      disable_irq+0x3c/0x4c
> > > >      msm_pinmux_set_mux+0x508/0x644
> > > >      pinmux_enable_setting+0x190/0x2dc
> > > >      pinctrl_commit_state+0x13c/0x208
> > > >      pinctrl_pm_select_default_state+0x4c/0xa4
> > > >      geni_se_resources_on+0xe8/0x154
> > > >      qcom_geni_serial_runtime_resume+0x4c/0x88
> > > >      pm_generic_runtime_resume+0x2c/0x44
> > > >      __genpd_runtime_resume+0x30/0x80
> > > >      genpd_runtime_resume+0x114/0x29c
> > > >      __rpm_callback+0x48/0x1d8
> > > >      rpm_callback+0x6c/0x78
> > > >      rpm_resume+0x530/0x750
> > > >      __pm_runtime_resume+0x50/0x94
> > > >      handle_threaded_wake_irq+0x30/0x94
> > > >      irq_thread_fn+0x2c/0xa8
> > > >      irq_thread+0x160/0x248
> > > >      kthread+0x110/0x114
> > > >      ret_from_fork+0x10/0x20
> > > > 
> > > > To fix this, wakeup IRQ setup is moved from probe to UART startup,
> > > > ensuring it is only configured when the port is active. Correspondingly,
> > > > the wakeup IRQ is cleared during shutdown. This avoids premature IRQ
> > > > disable during pinctrl setup and prevents the observed stall. The probe
> > > > and remove pathsare simplified by removing redundant wakeup IRQ handling.
> > > > 
> > > > Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
> > > > Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> > > > Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
> > > > Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
> > > 
> > > Where did you receive this tag for this patch exactly?
> > 
> > Since Jorge was involved in validating the change, I’ve added him under the
> > Tested-by tag.
> > 
> > Please correct me if I’m not supposed to add this tag myself.
> 
> let's test a bit further Praveen - we need to validate/trace the wake
> path on a real scenairo to make sure it is not cpu intensive (although I
> suspect the 2% was due to the storm you described more than to the code
> path itself)
> 
> I can then provide the tested-by on the list.
> 

um bluetooh comms are broken - reverting the runtime_pm patch fixes it.
and the proposed fix (V2) does not address this scenario.

I agree with the common sentiment, I think the patch should be reverted
in linux-next and better test definition shared.

[    1.451715] Bluetooth: Core ver 2.22
[    1.460668] Bluetooth: HCI device and connection manager initialized
[    1.467034] Bluetooth: HCI socket layer initialized
[    1.471922] Bluetooth: L2CAP socket layer initialized
[    1.476988] Bluetooth: SCO socket layer initialized
[    2.504958] Bluetooth: HCI UART driver ver 2.3
[    2.509427] Bluetooth: HCI UART protocol H4 registered
[    2.514600] Bluetooth: HCI UART protocol LL registered
[    2.519978] Bluetooth: HCI UART protocol Broadcom registered
[    2.525662] Bluetooth: HCI UART protocol QCA registered
[    2.530915] Bluetooth: HCI UART protocol Marvell registered
[    2.764571] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    2.770503] Bluetooth: HIDP socket layer initialized
[    3.901958] Bluetooth: hci0: setting up wcn399x
[    6.202761] Bluetooth: hci0: command 0xfc00 tx timeout
[    6.212294] Bluetooth: hci0: Reading QCA version information failed (-110)
[    6.219261] Bluetooth: hci0: Retry BT power ON:0
[    8.538729] Bluetooth: hci0: command 0xfc00 tx timeout
[    8.543988] Bluetooth: hci0: Reading QCA version information failed (-110)
[    8.550989] Bluetooth: hci0: Retry BT power ON:1
[   10.810736] Bluetooth: hci0: command 0xfc00 tx timeout
[   10.816095] Bluetooth: hci0: Reading QCA version information failed (-110)
[   10.816110] Bluetooth: hci0: Retry BT power ON:2
[   13.082946] Bluetooth: hci0: command 0xfc00 tx timeout
[   13.088490] Bluetooth: hci0: Reading QCA version information failed (-110):

