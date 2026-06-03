Return-Path: <linux-arm-msm+bounces-110933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jrCHNFYAIGpRtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:22:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AF63688E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:22:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ggPtm+b/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LaZMBSKe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110933-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110933-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C2EE3021D00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1114B169AD2;
	Wed,  3 Jun 2026 10:22:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4E37EFE9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:22:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482130; cv=pass; b=kkFcVJVihqmY60Zod1ePSa8SOK+KzRe/ZU9LwY7CNnPjFLh+vkXKRISRge7t/93B3BjkE2sUfgndWMlPVAWtz4IuLeReuavGzLqVa9e2V+gczOKA1hFs9Z8F4A5rdyGThWBdl5FZe/KMqwYoGixLlQrW7vtddmWhLvieJNHEv+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482130; c=relaxed/simple;
	bh=E2lhkkD3vWy6NShu+6BbZtfRRL57cJEm/DnxgbgqJzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNpuOMwDD22j7rC7/LiBhW8iXL2QPV2UrHpGnK6iyUtZD724FjLNCZSlFNKYL9xBhax2bFvnChMIZvyD63rLcNAuhlty+xkCDTGl68fzKLcCbA+E3CPxdMmyVvznw9t7+t3L4dEej3A5oGcBq7PnIXlc2s2Rq1NgWjrtdO7P02M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggPtm+b/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaZMBSKe; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395rg4780736
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=; b=ggPtm+b/RYN+MeI+
	xoY9WyTn+S7y2qVMMR/YeJ9nZ3kOZ02NrkVv/MiqDf4nY6boxWloVv8WXY+2nGx1
	BGgyj7ltYgEsKBrD6aTYLCzL2HMe8kqhnBeUgKGsYM3IhP3A32O9BI+UyN/71q4E
	tFbY+ZScGieO2Nr3wvNVzUrpE6ol1pNkzu3vjbU6IQtycLJH/4lz3O9WnsxqkZI6
	4h6F5rZzd/3wOny3rZt57lySTpUCdpeOgJtfzFiFxXnTjrqQjWb3WSEbIJzPcCMP
	64ZHlY8/X90XkqkLTDm7DBSVhuYl6EuK1T3CNksAU5nbBgSFI+nEBrRVsDkKiBSh
	dcIuLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0avr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:22:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157c8eb597so338572685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780482126; cv=none;
        d=google.com; s=arc-20240605;
        b=DzwhBzjZ9ILNJ8iPSSFroUO5rra7lATYDgbXDdicVzrKLeubtQ7ZPSR0JJdgFPcW91
         GEBprWk7TAt6Ko7FeUribjQc2MUKKoX7oPlqXMDxG1w7eKRmaaO2h6q6gk7+28M/MUp+
         Q2lH0IgHQTDvPBRWbDuBcCArKtlwjPabfgX0JhtBXtVqH08qTafdsI6C3Y/tTKmVwqs4
         y7clXZj1Ngjvv/Z2o0sF7xp+DxhaT9TA3ve09NG8Grru4VGpXHdd7lD7iAv3TAOtYm7p
         aiWQjg0qaMEh5Ur2s8bW5BeSdWIDyf9xP8wEfEIXAFgWLfLWJwk8aJxOndQEyltEqCzv
         TUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=;
        fh=h4554Ify6Cr8OXlkJFUlnbeUBvNLZ7l2x9cr3MWx6aQ=;
        b=gu7+0IX6u+99urjzlHkiv/1Ez/Vn8XObj4hCJB9Y5dVax07EP9eiBh1FzL+GzhfPtg
         yzCe9nvwc8vf972D8mtaG4/Yk1ga8YC487BjIQHV0VaPvC6Uh2ij0vtmfe9dAfHmuM/P
         GwxtEZMcuLRUJobTsH/aMaq1UV/hq641ludqZoxsClT1LKLrB1mZgrFHOqHApfkimS+6
         8Kv3WCQ7Px8cRDut7MZ67IqB1G2kbTMzqQIXMzxgQgncYbbIhtJFmgjtBKAjJ3S6xMm2
         5xtkYnlkMVFdhibDMF4E8GOl3aMX376WkbQ96sIDi11RD3jaIsNlycvmBZCZVf7pBMwk
         YLrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780482126; x=1781086926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=;
        b=LaZMBSKeo6/ErUMaBh6z+5iNYAbYiBUUOtDB5XR/It4xnqAKJsRfWo9BRtO1NJVms4
         dnZNfygofNZ/prz8vfD3D962W/Ijm6GhZxiiW4DletWvdShvoPveUp+NxWQuQbaFWxVa
         2vWysh9hNi+Vmug8+thgcHoYP8ijuXXqHNFJcHpQK/gJa6Sz7xA4A1/6dG6hIFKL9GcQ
         gb2CqeJLQnLMzTyRSxX1ofbKtMqFRgKAvEyAWIOZZNQTU5Qrl0KX+6Z2tuy+r6i0wgnq
         jh5UEL/4bTeEAFK+rCc76AAKpJ1+eKdmtKYcGeZhRFV4GSEyxy/63w7JtHq8c6wd+6Du
         Dv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482126; x=1781086926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=;
        b=WRTZZ9eGEqBhcIzUR6KdE0LZpYaDDvv1Pfey/6C71sHULIs7kJ4cbGcQjB3S29+Nxd
         ceyg6jHOQBtFlDHkoCg/hm15X6uVuAFtvMRgqwpWkg3TeKshf7vc34P7/ybahbQ6hUqI
         GN4mVFtVMSEWrkOL1EXbNId5dCRIWBEzYtlIBl+LVo2RCgCi/6kw/PSS/9fim1C2dfCb
         V3L9wElY0yJJ3rHvzBUrvQHE2az1gSH1Oufi1sTcWO6EUhLSNEvVHIr0d8srTZMRpHqX
         7+c+O7nRpkdM3HuIs5NuuKHgRW7f36Z3GjGiAdvXMsVm+dkdHBhHGsTB+Zmkoqn1m9tI
         ybkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zYEVHuM4Oxsn4LJKoO2GEZWC8CqqMODxWUtDl+aVfh+KZHA4wB4CLeX58hzI3cb2Fz7kGCcQGJsPHxfWd@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/hy7oq/o06qhD9+v5gzfiCuWwkDvcaEEjGcjTB6hTJcCSb/K
	RR1gDYCgYArYFzyOfCOCxswlwx5I0qxgLUTvf0EIlRog14nyo1TqB8Qxuwkx0TyFkxpvgWzTmqQ
	JWcfy3+7oY9OOjz0NkOz0etaBZEUNy/btyodqCosae37Ke5zni+IIC8qqdTz7UnTlZ+iwA0Ije6
	8jj9jKWWf6yLewtJ9JbgiNDtvk19Lv4R/ef4nPzmoUJiE=
X-Gm-Gg: Acq92OFjR1mER7nOiPGtARFUHiMrlo0bojvMMU2O4E1IBuGsoHhW8AKah0SZkxmRd5Z
	oRI+HIKzmBlYku43c2xx+Vup0YV146IotGjALjofCHFH3V6hs7F64nz3bd7fsfcYRL/YB6neAoQ
	fC6RKX8dGkbN/zKWgy5dkzSWL05tUyesjLkj7UabEnoLjGVmCorEf+DrRGS5dSKhMw6N7dErDd0
	bEKWLXjGhcHut2k8bCezMNqlJV7T5uY1T5nsS8R1RuWIRYzCDA=
X-Received: by 2002:a05:620a:410f:b0:915:4c90:34fc with SMTP id af79cd13be357-9158a645299mr474824285a.11.1780482125547;
        Wed, 03 Jun 2026 03:22:05 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:915:4c90:34fc with SMTP id
 af79cd13be357-9158a645299mr474818885a.11.1780482125039; Wed, 03 Jun 2026
 03:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603070608.309114-1-zwq2226404116@163.com>
In-Reply-To: <20260603070608.309114-1-zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:21:53 +0200
X-Gm-Features: AVHnY4Jf_VeyqqmKkqRnsZXE1Bfk8QllKlsKD1FlosCDBNy9-wJjka38T5nKSN8
Message-ID: <CAFEp6-24xL80zhK6rgAqHv2z-P7=v1vF-5f0XjfPPmB=2DaSBg@mail.gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL
 and RW151 support
To: zwq2226404116@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        mani@kernel.org, ryazanov.s.a@gmail.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: LOsKwms88MPCfJsVQUDIuBXdz84CDRbO
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a20004e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8
 a=qXxXCjKvfSkB11hXGCMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-ORIG-GUID: LOsKwms88MPCfJsVQUDIuBXdz84CDRbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5OCBTYWx0ZWRfX5PyKexnUN0/c
 nyyzsZhBoLnZVjDzOxzUpSQXwe4NJyVn2FBzbl6/GKvUW2/OcUdtNS/4cBaUsSzyHSP1mraacMx
 N06Wf6yrWDB3eKdrxiPQcmclmHaCQqIUewDf0YZeVKxZv+GFZHpLVBL3w0N74Yjk6RYHZn1/Cz+
 BuVOZbXmVp8MMdDIk6t6Crs4WovAeFZtPJGxx8+8zmI2/VQPumxh29ElsbKO18smJeB1qPF+iKO
 1C+0uoR+sU/WUP0FADG3FoPUfB7rX/nJzDzU65wv8kLdzalFTLbT/WnUgiuwgzqiqchQAyap/p3
 1/1LIhavEphe2fiKdbQy5i1uUBFRA1wHHPEYPHCoInlNjtALvWMXt62FrghkGpAhaAoS6V0ektt
 UJAI0M65lT3DQJyqlQ+X+03QGMix7piMt8Fk+sJ/G+9eSdV2a33F51RUQNfarY93bm7OFO72LC+
 IDWzE2dFokgolzSHlzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zwq2226404116@163.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:mani@kernel.org,m:ryazanov.s.a@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:kuba@kernel.org,m:wanquan.zhong@fibocom.com,m:ryazanovsa@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,gmail.com,lunn.ch,davemloft.net,fibocom.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 497AF63688E

On Wed, Jun 3, 2026 at 9:06=E2=80=AFAM <zwq2226404116@163.com> wrote:
>
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
>
> Add MHI PCIe device configuration for Rolling Wireless modules:
>
> - RW135R-GL (Qualcomm sdx35): MBIM, DIAG, DUN, NMEA, FIREHOSE, ADB, IP_HW=
0
> - RW151 (Qualcomm sdx75): same channel layout with adjusted ring sizes
>
> Register PCI_DEVICE_SUB entries for vendor 0x2099, device 0x1300/1301 on
> QCOM 0x011a (sdx35) and 0x0309 (sdx75) respectively.
>
> Enable the ADB MHI channel in mhi_wwan_ctrl so userspace can access the
> WWAN_PORT_ADB port via the wwan subsystem.

This should be done in a different patch.

>
> Tested-on: Rolling RW135R-GL / RW151 hardware (MHI probe, MBIM, DIAG, ADB=
)

Have you been able to test suspend-to-ram and hibernate?

> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 100 +++++++++++++++++++++++++++++
>  drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
>  2 files changed, 101 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 0884a384b77f..ad166de2d0f3 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -902,6 +902,94 @@ static const struct mhi_pci_dev_info mhi_netprisma_f=
cun69_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] =3D=
 {
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +       .ch_cfg =3D mhi_rolling_rw135r_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw135r_events),
> +       .event_cfg =3D mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info =3D {
> +       .edl =3D "qcom/sdx35m/prog_firehose_ddr.elf",
> +       .name =3D "rolling-rw135r",
> +       .config =3D &modem_rolling_rw135r_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .sideband_wake =3D false,
> +       .mru_default =3D 32768,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +       MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 50000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info =3D {
> +       .edl =3D "qcom/sdx75m/prog_firehose_lite.elf",
> +       .name =3D "rolling-rw151",
> +       .config =3D &modem_rolling_rw151_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .sideband_wake =3D false,
> +       .mru_default =3D 32768,
> +       .edl_trigger =3D true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the=
 last entry */
>  static const struct pci_device_id mhi_pci_id_table[] =3D {
>         {PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -909,6 +997,12 @@ static const struct pci_device_id mhi_pci_id_table[]=
 =3D {
>         /* Telit FN920C04 (sdx35) */
>         {PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fn920c04_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx24_info },
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, =
0x010c),
> @@ -941,6 +1035,12 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE990B40 (sdx72) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe990b40_inf=
o },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx75_info },
>         /* QDU100, x100-DU */
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index fa73861db6ad..c0bba94d5c3f 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -264,6 +264,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match=
_table[] =3D {
>         { .chan =3D "DIAG", .driver_data =3D WWAN_PORT_QCDM },
>         { .chan =3D "FIREHOSE", .driver_data =3D WWAN_PORT_FIREHOSE },
>         { .chan =3D "NMEA", .driver_data =3D WWAN_PORT_NMEA },
> +       { .chan =3D "ADB", .driver_data =3D WWAN_PORT_ADB },
>         {},
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
>
> --
> 2.43.0
>

