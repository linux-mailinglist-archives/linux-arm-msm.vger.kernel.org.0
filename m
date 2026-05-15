Return-Path: <linux-arm-msm+bounces-107699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP+2F+6HBmr0kQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 04:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A7548CBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 04:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830D4303265A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 02:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855533C276D;
	Fri, 15 May 2026 02:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXnNbGWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="El++XoKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D73C0604
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778812907; cv=none; b=YcjSAkXB6QMKhLt9fiicmigGw6Vp1o12b0ArEZAl4XIKpyUn1xWLsAbAE4M2VUEvUTsJenyDtRPmNYnLPhdYzCzx2us9IrHvba7Vmky3Q3mPlwi1OcGQaA0O+6BypyQYdbLe+/IkkJDpF6u/zL0nk4UNt4ZB7GZRZtKtgpYsB6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778812907; c=relaxed/simple;
	bh=tQJDvtOKyvN91a7clBigJ7afY+rwLVSxfVNDBpLptDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oqg22CY/qPSETREA06OBS//x0K0unCz+bv8PEku9SiaLKSZqtogNNt6iid+0m3uU7qJIR4NWPV2OuFL+XngFtgzx7Dj904+MiaUjqG2riO5l+Cw1OcKpb0eHwjvde62IZy9cupnMlRxTLt7redY5bFZabppmqhVA2kEKcHGC7f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXnNbGWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=El++XoKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpBGb654903
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3pzRPBproSAwn3/k3NUAF7Dmxhho6pMAtdyQF0YbrU=; b=PXnNbGWJhiS4yvJ5
	e1MRzsW6unyf0aAhDixClz0/LOKbcapG2uct7MNBNMDAY5pPFAUCIMGOuyNkXBB4
	mWckSLVqs3c98HEXjKu+GsHIkIZ3Dh9H8vDsk2b/CPOIrOVMoiR33k/VTi0zMH5V
	4ABhIgY3jmS2rnuur0YwfdJ9izuXqe7i1n0co4nUQkTRwux+wR/yrloKlEOqNGb1
	ZoGHp12ffyCB3pxj+rIzetOmPbOSX1r9pZPKfnXEV3RYSAxP3gBOQIMnlKWwlV0v
	Ose7oNAjL+S1r6ZrcTKphCkZUZ2bXp3H0o0fNVB9for7TjAobJgdgqBQtLoZOz3M
	cp4IjQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ps8ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:41:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13312be8a31so8445404c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778812905; x=1779417705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3pzRPBproSAwn3/k3NUAF7Dmxhho6pMAtdyQF0YbrU=;
        b=El++XoKI0bQY5Q1wszj4jnPeitMIYl5uJBLygwNxzx0dciToGiEvw41sK+TUr2VU3+
         0aS57/mn1twlJOsakmM1TGTw6AP0C8kpLpDPU/mTJKfCGi7Qutbaj6HKb+OMlncm5iB7
         KJj0bpONt82gklE5zdDggyTJNgOPgJJaSBpAT4yfkroQUTg+1F6qKygD7fhbo4DGa0F7
         S9FoFRD2tgxqIGJay7ZCaQ0K5h2rOTargJ2XLTJgtMUJiIfUCi5pXoG8gmBtuEGE7ouD
         DykAzT7EqD+arf0w3J1LVeB5zuHhami17ZM+VvTPgGpCZoFWeCi5TKvfOKaf3X7SkSxE
         vCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778812905; x=1779417705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3pzRPBproSAwn3/k3NUAF7Dmxhho6pMAtdyQF0YbrU=;
        b=H6g4urV6Sd9Lt84nC5g6M1shojiQ5DjTSokEIrzNShhctaZdhgsw6cHH799qYXE1dG
         nHiALe6YEh39bc4J/MLizbzk0S+BVwhFGk+fmlpNTrll6u20gdmoyjJF+TeNpdKPeSwL
         33+kgrEVOUAnHXzVrBplz15yGf8Vq4q4ciNgzrNKa2F+kKyyeP+JiC2H8Llxhjv0Rqct
         sqedbxksLxPQ1BtREpWrjzqHZ7C1qQCesVAcjT67+v1/m94LrOfBSZmjRYLtwlIuE9+l
         lgqPTGqd2jgOUs2eV5Y1O3PZAJahMJTBVRoGpbZvhRoQmf2dVqGokFWsK9ZL/XQQUaLh
         jYFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MfwXtc2QujVktL9cHuXRgri7XR+HhYy9hvMlExLeC6pGmIPmmPOTsmPqeMV+gHn4HxlHZO6tWoestYJK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JVbT/XGDV7owspidU5hfiZCFvTiETw6TLPUfREjSEQnIwM4d
	DuckP2BiomT4ueZIddERYkqYb2ebqw26JN1WbWtPqD+UX3yKiBOkwSiyMCb2bPRA4HZzY8x0sFP
	8Jr0u4cWjjehEHFTuKsPfXiiAFmmN8F2P7AFH2WcxYxSbpw09v5Bdjxu2AgBx07KmwKgO
X-Gm-Gg: Acq92OFF5RL3oa8GTkVpHSFRH7hW+tYtQmxyIgAUTh17aI+LNuTIZe/WXYIufIlb99d
	jxFkbVrVCU0pGeklDIL8F8w+8mCerAsKyHrCXJUg4dBj/Dpz1AJpYmk8I7hiCOeAYKqNRdtSdMA
	2EWljtTFCFFt6ynxE4TmNOXjdPdhFPo8TrsTpGlyXlPcJT6j6S04iQ2Z9AE9xvCm80vWBV9BNDG
	T1PT4D1N2i5mzdLXcYQOtd4B+T3ScS5pfiPKhqrKN5lsXKWfPL3vzNbgLjLy6v6+GrxMDHPGC/4
	ZMfPRO4Rfb9ZUyI2kSviqe2pB66tnK/HHUwb1h0YO/NS2//1d4y1WAy8vTwNhuX3SMHFrEoo4yh
	G8Bz0cCk+7K6RX4vjhhEwPPrU4kjOG2xf7X8v13sW7Tl7+KrBU5f+g0s+c2aRbG6RfRxL1e50j7
	LqUQ==
X-Received: by 2002:a05:7022:1a85:b0:12d:d972:b96e with SMTP id a92af1059eb24-1350542e8e5mr834643c88.20.1778812904586;
        Thu, 14 May 2026 19:41:44 -0700 (PDT)
X-Received: by 2002:a05:7022:1a85:b0:12d:d972:b96e with SMTP id a92af1059eb24-1350542e8e5mr834618c88.20.1778812903959;
        Thu, 14 May 2026 19:41:43 -0700 (PDT)
Received: from [10.110.13.193] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm7689429c88.0.2026.05.14.19.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 19:41:43 -0700 (PDT)
Message-ID: <51a08590-a662-45b2-ba04-195b020c26cd@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:41:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: makro-kernel <makro-kernel@proton.me>
Cc: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
        "marcel@holtmann.org" <marcel@holtmann.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <GCBTvsv1x8qAB3ZmSCpTLo7M63lTTXM2c5n1TJLmQuus0g4gViSSJVRZzl6CzehnMdSHDqtZkQA33RYCVSxdAm7tGEeVYCflhV3QgbLIcfg=@proton.me>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <GCBTvsv1x8qAB3ZmSCpTLo7M63lTTXM2c5n1TJLmQuus0g4gViSSJVRZzl6CzehnMdSHDqtZkQA33RYCVSxdAm7tGEeVYCflhV3QgbLIcfg=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 03noRK6gheKkJ9f6hS7PgWs2ikzC8PTe
X-Proofpoint-ORIG-GUID: 03noRK6gheKkJ9f6hS7PgWs2ikzC8PTe
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a0687e9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C8FaVdaJT2XKlJamlsUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyNSBTYWx0ZWRfX6IaZ2o0hNfTx
 rKVxtfMjIfbtSIUezyLryLqeqz1n8FaSNVIpJHCZq1uGWx6GbXc8AGT+3w2GAbWoEatqqDbWqEn
 YmQpXzreC/HF7/rYjj0CmSp0gADwv9sCC1+z0Vj+nNHFKWrFcOQGCgALhjnZxnsz6drmkiIeo0s
 jcFgOLU1cg1bqM6ii9lybSEjzvxnsnetso5ukOqg9RXHOGcQV0+05VyJmi+f5hx8+hDbyI8I4Ja
 311SM6Gbhp6xjhDbaP8A1q4RgTBN4wOi0iBErzOb3YCSkqrlUFvO25ryjYOJuPR3YXwcFusC+iZ
 tQq5cknaH4e467QJrJgEyPbYRn4ecTqSdxlxenqoAnaRdthX0CkbJQztJHWv3T+nIUHIKI4rj+h
 h+tf8bu/4AwDYSSC95lpo0pXVNK5EERFSjQ8YMQ1AaJgXthIyEsEnDrq/ygXlHOVpo2u8KTtmk/
 vD2c4QmVEh6AW5I+xQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150025
X-Rspamd-Queue-Id: BB7A7548CBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,holtmann.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

  Hi Makro,

Thanks for the detailed analysis.

On 5/14/2026 10:44 AM, makro-kernel wrote:
> Hi Shuai, Luiz,
>
> I sent a patch earlier today touching the same function for a related
> but distinct failure mode in the same family of chips, and only just
> saw this thread.
>
>    https://lore.kernel.org/linux-bluetooth/aD_Lix2EVXOHmbZ4L1CunlWiLqfiKlU_1_FcVh4CBuIgud4kmE_544xjW2zFKsmh4pNAo9yIQ7q8_GZ4YcmgAXPp8LgW9rfWKqnu06WSjgk=@proton.me/T/#u
>
> In my case the *outer* check fails first: on Foxconn USB 0489:e10a
> (Qualcomm WCN6855/WCN785x, ROM 0x00190200) the chip reports
> QCA_CHECK_STATUS = 0xe0 (PATCH_UPDATED | SYSCFG_UPDATED) on every
> probe, so btusb_setup_qca() never reaches load_rampatch() or
> load_nvm(), returns 0, and the controller runs unpatched firmware.
>
> AVDTP setup later fails on Acquire and A2DP audio cannot stream. The
> PATCH_UPDATED bit appears to persist across cold boots somewhere on
> chip -- originally set by Windows on dual-boot-then-Linux systems
> we've seen, but the bit sticks even after a successful Linux firmware
> upload, so subsequent boots also see 0xe0 and skip.
>
> The rampatch itself also persists on this silicon at least across
> suspend/hibernate resume cycles and driver reload (whether it
> survives a true cold boot I haven't isolated). Either way, once an
> upload has succeeded the chip reports patch_version equal to the
> file's version on subsequent probes, which is exactly the condition
> your patch addresses. With my outer bypass in place but without your
> inner change, the second and subsequent probes hit the existing
> `rver_patch <= ver_patch` check, return -EINVAL, and controller
> setup aborts entirely:
>
>    Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00190200.bin
>    Bluetooth: hci0: QCA: patch rome 0x190200 build 0x8567, firmware rome 0x190200 build 0x8567
>    Bluetooth: hci0: rampatch file version did not match with firmware
>    (btusb_setup_qca returns -EINVAL, hci0 never finishes registering)
>
> So your fix is doing the right thing here, and on this hardware both
> sides are needed together for the chip to come up cleanly across
> reload / reboot cycles.
>
> In my local tree I skip reuploading on equal versions rather than
> re-uploading on every probe:
>
>    if (rver_rom != ver_rom) {
>            bt_dev_err(hdev, "rampatch file ROM did not match controller");
>            err = -EINVAL;
>            goto done;
>    }
>
>    if (rver_patch <= ver_patch) {
>            bt_dev_info(hdev, "QCA: rampatch already current, skipping download");
>            err = 0;
>            goto done;
>    }
>
>    err = btusb_setup_qca_download_fw(hdev, fw, info->rampatch_hdr);

   I tested on another device with the same ROM version (0x00190200) but
   a different USB ID (0cf3:e700). After a cold reboot the chip reports
   firmware build 0x43fb (ROM state), meaning firmware is reset on power
   cycle and QCA_CHECK_STATUS does not return 0xe0. The rampatch download
   proceeds normally every boot without any bypass.

   This suggests the NVM-persistent status bit behavior you described is
   specific to certain vendor configurations (e.g. Foxconn 0489:e10a)
   rather than a property of the ROM version itself.

   Given that, I wonder if removing the QCA_CHECK_STATUS guard
   unconditionally for all QCA USB chips is the right approach. For chips
   that reset firmware on cold boot, the unconditional re-upload adds
   unnecessary overhead on every probe. A device-specific quirk flag
   (keyed on USB ID) might be a more targeted fix, leaving the existing
   optimization intact for chips that don't exhibit the NVM persistence
   issue.

   My inner patch (changing <= to <) addresses the USB disconnect
   recovery case and is independent of the chip's NVM behavior, so it
   should apply broadly regardless of how the outer check is handled.

   Please correct me if I have misunderstood anything.

  Hi  Luiz, could you take a look at my patch when you get a chance?
https://lore.kernel.org/linux-bluetooth/8f5362ca-5513-4d9a-8922-6603783c9ae7@oss.qualcomm.com


>
> Best,
> Makro


Thanks,
Shuai


