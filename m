Return-Path: <linux-arm-msm+bounces-113315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LUcJB1O8MGocWwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 05:00:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AA668B965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 05:00:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MmIRBNZR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z742gz2N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113315-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113315-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4C2F3003804
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 03:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FC0DDCD;
	Tue, 16 Jun 2026 03:00:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC62F1FEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:00:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781578829; cv=none; b=hVxd+eDKAO2kdzrFX1X+tZi8bGlcJDW9OXilt/CbQupaaIDcK7o/cQJDtnovsaP85/tJFylRblt4WFf/6FqQYlEAm+6Tq/oFjqux0beoE/2SjU7hDEouRwOqw+DWpkOKN+cBi4Yo/qPEI7F/VwsXaHPd9JyzDlqkqGM5Kq7AvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781578829; c=relaxed/simple;
	bh=NAN1d7tO2dIhLg5S/FLyH/p5tRrqiSHvGFXcTWtJID4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q2/+IxUY9cDc/JoeeZpd0ZubV7I9dTrT/KdU1tOWsV4IAh/+SD8qcpITaYelMnjlg+7hiS3J0uwNddwuc0xkTXqgR5r6ridXAANs/FxKA6bwqEoLQWGwaGogJeIDoeW80hfR/nSo3z+YU5yPlzwRwhwqtbnDCsIyA4iMuO4xhe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmIRBNZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z742gz2N; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xf8X1790294
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1Y/4e6Nhij4
	BXRQLAIgvXZ1lo9BXoQZRcdA1/kO02rQ=; b=MmIRBNZR/fV2CbWHPSDPVboiD3E
	XeYSNqWwLRxHSU8HyYq2SoClLRAAleZaU0Bsj9eAFNwALrlCQfLwSdCleQsA+DKe
	RY5LZS9VQOEvBeRUnkJgwmZ3EWyULddGXvXTXBuQYXrnB5vFKWPdWGVx8JIYN8ZH
	tFsoaHyQM6r8C1i/YRfsaQp341W9rr/zY7yPAxa2ay9CkElj72k0KtC+T/xqpjvG
	XluleBsvWkfjA7OhtNgqsvcD9S00mAYS2+AGX+h/Tkwd+X6KSR7HASWBfF269RPt
	3XIIdnhHMs/A97luW8YKcyfnL8Fqg5V+GjSuTrkjfdW9I1ddBgqRjfdThYw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0md4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:00:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137daa666a6so387320c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 20:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781578827; x=1782183627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y/4e6Nhij4BXRQLAIgvXZ1lo9BXoQZRcdA1/kO02rQ=;
        b=Z742gz2Nyk8eYRTKBTLALr1qMhc8VbfKL5k9byhxsQOEeHL9+FOJE6+f+P/3B4fkU2
         2HZIFYYEpfjMD3TBxtPNZFKNk+VxTfq6ISuksSArfWCaT9u6k2YgcFoVhRySIQPCzWim
         qibgIJzxrI9HdSUbdta2jX8/BINJQkHLga3BhtI9F35BmJNGtQlR5TQBACK5Tsh9jD03
         o4L5J3qSslhKT+Ltw9qE4hYHxaPGZdxcdU+1mEjFQTb1POaGyp9cxf027zhRPKloXE5B
         4iOQBL7Lwk/wNhvZRt4moe5FTmYaw831UkK2B9zHDXro5IZZyZ/0qG1BaBAt2l7MqBzL
         OLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781578827; x=1782183627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Y/4e6Nhij4BXRQLAIgvXZ1lo9BXoQZRcdA1/kO02rQ=;
        b=X15RvlyNLSsKjpyFrPYJwhhlRoPCiRnRShtrmO5UPOczQ7zGbTuOdXjz+BbzjYy+SW
         GKYq77VbfsdVv+kbNtugophjfEH18fSPA0J6Ba+2s/Sy2As04N4PnCU1jHcwvlxJMK0c
         udm6pXav/fbWtuIqfNGJuYpfya1yOJajyJDAR9C99R5ajw8kwYe4B4yXTVxOSKvw5IiB
         iDBOjJThLbUbCDDC95Q3zbSco/KKtxVR2jeBDChBLoBeQDPfQJyiyPl8CDCQhLfsKxZI
         wOT0uVV/2hjoqqYpDfDngh59Qm72cnL8dNqAHtw/XJY77kr/fPg8ssi4QcMqDuhtiX1s
         MhYA==
X-Forwarded-Encrypted: i=1; AFNElJ9QYR6Ac1sl38x0bOoIJGAUaxCZ6dWykclKgTeEuJa+h3pZSv5wvdpt58U9jDw/GdVQYuyOZwZT9cz9pcKV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5rKsuS+BvO3rLAzV+4bgZpl63gr19+66fwFtzfrSp/HUPjuO
	EE/E0sEYOK/njiXDWcn6+MME7C8qufuffC6g47zluwL9LUnS+ypPHOoXHZLRGtG3KQlDg96kLL+
	FZZqMfUEF1gccNFYWBmC+w3Ade80pcoWDZ1BtdOl6Ec/m4IpuSRTbrvjUQNnJGmTFDMI2
X-Gm-Gg: Acq92OFlN06VIYKLBi4ZU25xrRyHBrGmuXQ/Zqw503X46h3r6zuHIMFSq7JzUr5tPzw
	nORrd8SgPDXd7eVIEda8HPxFVSljdoKKTXgH8SOfoNtBYevWCSJ/RuuJ/vPNBrW8UudvGt6fc0N
	EXbWYrOckXisuVj8qqGgUtac27Eho1z10v/sPrPd6O5ooso/ebZ9v8gb0auM2XwxrTvvwWersmC
	nvKqYPjoDbq/2GZndV+HWq5ZJ17tMdaEAnKOqNzLtIISu5HAtpY3ctqo/kU0R8lZlOOpZ5xH8fN
	BhTgpps/LITcB+M1GE1OgPHnJzdmGTPd+3dDcxBM8W+gN4F4X16z3SU680eud3c1kLAWC/FWAW7
	Ati1SCjZWzgIp2iD1u6HUxDzGh+1HCuZJMeCMO11mNA2WTo5bj9cnILJmXP4KK/wgg/YFeDh3
X-Received: by 2002:a05:7301:100d:b0:304:c73b:79ea with SMTP id 5a478bee46e88-3082008a304mr4529556eec.3.1781578826587;
        Mon, 15 Jun 2026 20:00:26 -0700 (PDT)
X-Received: by 2002:a05:7301:100d:b0:304:c73b:79ea with SMTP id 5a478bee46e88-3082008a304mr4529541eec.3.1781578826039;
        Mon, 15 Jun 2026 20:00:26 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91fb97sm18043030eec.14.2026.06.15.20.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 20:00:25 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, bartosz.golaszewski@linaro.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Tue, 16 Jun 2026 08:30:20 +0530
Message-Id: <20260616030020.3699706-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tspehw7yb6hrgek7rz6qghcoqr4v6cdpulbzpggii6qlmaatxk@gcb2tbb3qji2>
References: <tspehw7yb6hrgek7rz6qghcoqr4v6cdpulbzpggii6qlmaatxk@gcb2tbb3qji2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyNiBTYWx0ZWRfXybt26Wheuvn7
 eveWghTo6ztb7UwSv93q59rZ+lG4B60xKNVw23Mf6iEtGQ1kunwIJ6f4WSaPW+5Zehu68j0otiX
 /rhIHtevufAypI9B9F/VAQi4qFDDAH8=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a30bc4b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Hb1RCdnMn6tQr2U0v4cA:9
 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyNiBTYWx0ZWRfXwYeVuKbSVlXI
 mryjssnE3sptRLvM5Hj6Krwyx1DTNNDRIAzKiHOY3AwLiO+6ugoJuPwWyNTteY3kikmHZJDnsAE
 NxoBUIsmHEzO2Z7YNeaffKBuE4QVaVBurrPPrqQlsenJvgkkzsTylYeKHYBYW9vZ9MPprmLDOMI
 EpWIe/bCdO+jFSiEucxbwlJsC5UcSGgWQ18K0/gibpy1Bj8QTEC+Q9KNX/3cBMxa7wD4jcgkJKt
 J9Me43ltqy5FqiA1LEV/X/lM2DWLHZgrRiV8k4d5yXt0KwQIQgZ5b8cNqCGqnIly6gcyk2LDmt1
 nYOwBad0pvLYoSnM3GCrspxXoSoUaCNgPowz8T40jG8tNElVWHlKyipnvQnudClf1fG68BhJPU3
 2FKWdJ2NErrdrfScV20taGeAvqCR09VevlQdxK90t7ArEK7ar3+eyvqUm9/7266AfJngRXSj3Bm
 TkmCCCstLu+YrtT7WFQ==
X-Proofpoint-GUID: wUEngRNplSbTyJ-KIqniwUxgVE8Q5YgG
X-Proofpoint-ORIG-GUID: wUEngRNplSbTyJ-KIqniwUxgVE8Q5YgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-113315-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:bartosz.golaszewski@linaro.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09AA668B965

Hi Dmitry,

On Tue, Jun 16, 2026 at 03:28:11AM +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 04:02:28PM +0530, Wei Deng wrote:
>> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
>> wireless connectivity cards over PCIe and UART interfaces. Hence,
>> describe the connector node and link it with the PCIe 0 Root Port and
>> UART17 nodes through graph port/endpoint.
>>
>> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
>> lemans.dtsi to allow the PCI subsystem to associate the DT node with
>> the PCI-to-PCI bridge device.
>>
>> The M.2 Key E connector is powered by a 3.3V fixed regulator
>> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
>> (vreg_dcin_12v). Both regulators are always-on and are required by the
>> pcie-m2-e-connector binding.
>>
>> Also add the serial1 = &uart17 alias, which is required for the
>> Bluetooth serdev device to be enumerated on the UART17 interface.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Changes in v2:
>> - Collected Reviewed-by tag and reorganized the patch
>
> Please don't send the patches as replies to the previous iterations.
> Each new revision should be in a separate thread.

Thanks for the feedback. I will make sure to start a new thread for
each new revision going forward.

>>
>> Link: https://lore.kernel.org/linux-arm-msm/20260608091702.3797437-2-wei.deng@oss.qualcomm.com/ [v1]
>>
>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
>>  2 files changed, 76 insertions(+)
>>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry

--
Best Regards,
Wei Deng

