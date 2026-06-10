Return-Path: <linux-arm-msm+bounces-112505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DLruB9xzKWpZXAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69566A31C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:25:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a6qg9sbM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FT2hiE7I;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112505-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112505-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DA9730B3863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87C630B50D;
	Wed, 10 Jun 2026 14:15:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72B28DB54
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:15:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100928; cv=none; b=UhMdGBpPGD45yEfZ35y788e4Aa6gthzLZoNxN8XnFSUSrLB96eXoRndApjCbZDrSaIljExIXikJ3lYWjdQlytfbNO6HdapY5ri0NiQtT93Qge6ZEhEjV/n2OWbD6fm8J1eJZjvJYiH9vzdAoEvZQYq31EaaA0/EFrfAHaX53Sz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100928; c=relaxed/simple;
	bh=MFXOZCdPBc0TVsd4Y2UVkvn+uoJb2263Pchu6fl3G0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqDBEU2AXMHi0C8pQ1SaR92vrX8+5t4oCQTGqU2jod0wBB2D7xdWFuupCYhYrne7tUPCEw6+DwQzTmD7ss2Mm/JiSwft1LUCyB/Cd8/1KCUL6IbV2DM/0MqofD+f3Q9pSOL1ANK08EDRdJor7ELspYJHFm2jiaQdcsMJhOQrNK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6qg9sbM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FT2hiE7I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBsic1600323
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=; b=a6qg9sbM49qI90pw
	IajAfxYbrHXzoHWl05FBcfEy0O9Fj/r8+2r7WxjlzP7v6A8EVsmAy2oMZ5pUuSf+
	p4OFEywRpVdVGc3oE7w0Wl4IEzl5ys5cSJtsm6Vo7rL/t2tNc8pPQj4c5VQEEqnk
	7YU7pSOLi7y4fxGC0Hyb5MkWIzktHIl8MQWJMmAedKs5xRVDuoXaLLx5ptRpregt
	nZLGKzwQabtpKgusyZD16C53Azom27trOWeETj+zoOVTkYL6jY4iUX7wmAL3S5NI
	Efbvq301aWIo67blgCfb0NXVAFgUEPeQS/WBWXFylwhZgGAdaOXgVe+CnDUeIJ8A
	ok78wA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg20j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:15:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd2462acbso6657519137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100926; x=1781705726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=;
        b=FT2hiE7IHhLq74SM4xmI6jQGSWHAphb3tueGkwRXNEDYmVB6MiBQVWcQWYivuDD8GZ
         bk4pyimS135eTAvjvkmpJGz4hHt/WA8ZwKQ4cNJGk3OxjLmZxnoysdrY9RC4bl3bf8Sc
         ZNGEqfAcK+hEpnlxrkwZGMcXPhhnyZXF4r5X5Dbzfq1CS6eXapqehAg6YvgMrHmz34uN
         3NvzPb4xkVwNOh1wSSngKxOZBfQ7YxJMi5RfLRDZYOabaX0Vq/4G3RHyBksS/wYPnxxR
         LtDw9Sq5W5U4Uit/7CbGcLVt7HxFLz5xyEOP/DjFWNtuU543MdTdh2WXoAItd7s7kzTO
         NTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100926; x=1781705726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=;
        b=rzKT52ciW0BVKIv9A06nqWn3vDPWHuEkN3AuwiNIhtK3JpkP1mEO03ByPWBNeaVh0B
         VBws+XLAYnhfiZqvLkbAMoH+x81rEYSaCd/krrkNnjDYraxGVoGfqZ3Jspc06zukv3xS
         M6y9cQ+NQGlGU8WSdrl0b9nZnZzPUzLfiizCGFyevCNDujSCGPviTucyIr8qwgLaIrBA
         KIA5DvDvHLgZW408UMsYKs6gSnFm1WbtMnwLYfICmV0//2vWVyQFBNPUWztDoe+ia19H
         ATQk4bsXWaH9+EhXn3HUV2XOk9MfWrifkS28oAidh6gXlZXCgrDW8t6cFp/6FtgUQbTM
         +vXw==
X-Forwarded-Encrypted: i=1; AFNElJ/2A9obSmTKb0zUnVRjuh1oze6yPMchr4sJA3HC3CxVr6tdB3om9Zj9Nrm/DHc7pnyuY4ZjGVtX1cD0dGF9@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuqRoMxKRLMY4emrM0qc8yUzdSFgZgcIk0decsXKEkEyZEiqe
	JVt+CR08Rtd+XG1vXDgoScOkBdtX0LPHpulvLqOZ8VWnt0S1toKTUdniajmG2J7AxmgyAcP1wM5
	5GcokPLez6VAnkqybnp0PeSVXSxCU8uas20aQ9IewV2ZzryDXCwJFe1IIi2GI2YjI6e/z
X-Gm-Gg: Acq92OEtt6QOtS2PXlOIxMqsJFyyPNcxfKTrSVCbTmK4q69Z+W1BlHjBfUoanaBF27/
	uIFStDUSNynwRyu4ohKJQ/bKWM6RlfEVxMAaZMG5GaRCnYMhMHjH+uFL2HIukk+ochGYmKgyLW3
	94EV7MBGq+lw3NFOy8NtOVtp7VAX8bykdKqeuuiRFIZTCYigCgX8lk5E4+PFNVpaXrAykXl+fEs
	JaA3PbbdQLm4tYIBwm6CBXoUZ7g400fTi6D/IaC5tu97VolqFv9M1Cu/64zaqXSqrTre1zJBvzX
	zL7YL5DtUXN+W7RgrUuHu8ozDBeD4pytRrlkwuF9BCAguqc2FcB3WIqK71/gPI+Fn9pV0GlfWTa
	tyBB+/s3LUHpcpURy4I6eCaEmOmR24xVXVTJY/Z6xCA1E2eiBrJacMdpY2lGpW4ma02UPsgpJ9p
	E6BWFD6ZILm2nEWvC2fY4=
X-Received: by 2002:a05:6102:6890:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-6fefa60e40emr15357906137.2.1781100925738;
        Wed, 10 Jun 2026 07:15:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-6fefa60e40emr15357838137.2.1781100925377;
        Wed, 10 Jun 2026 07:15:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7f50:81e3:bfef:b418? ([2a05:6e02:1041:c10:7f50:81e3:bfef:b418])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm67240484f8f.8.2026.06.10.07.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:15:24 -0700 (PDT)
Message-ID: <5105b5d0-16d2-44d7-9c9b-b6e982d7d53c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
 <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dtWsEdQsnknZ5Y_nkod486tcaEfCqXwt
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a29717e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=duYTza_KgoU2j0Zg4FYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNSBTYWx0ZWRfX4gDH8LbOZbLE
 MMDheOlmksn5uMJ3skYhuB3jWacNeVIGPZtQHigDZqfrhP5dHTLM1fYixnGWWYlIf+QrT1KM2C8
 TiGqm9GoFBRKXZcR6ghTqc8RfQlsljtz5IYOrDpeRTETn/eQP9K31zo4WF2eDx1gqJQwqgl/Lbt
 T1S00fWvr0AVPa8UuSn1+nmZ39iVUsXrs7q3BT+2pcLpOucc3E5MzG6824epRbqoO9MT4vZQsCO
 xwdPLstBFlpHN8E6HFEwSTj9ITrt2FkMqH5qwgd4b06vy/A8JTLjj+NFUHl5/E66Y9CYFU2oQKW
 nMHdgWvksY7ZE/66ly08NgecVa/xhTS4acNf7soMgjZM0Xn/dMeyaorx2zpHA//PX3Wxic5U/AG
 h6YZ9v7ZTf1FXGAPiV5emlVt8t/ohjEMn115MMImknUdNlNDHOPuCHxxQRfER4Sc/sK1FVm7iUs
 FO13X4rcBWL/kxxd10g==
X-Proofpoint-ORIG-GUID: dtWsEdQsnknZ5Y_nkod486tcaEfCqXwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112505-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C69566A31C

On 6/10/26 15:42, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 02:08:57PM +0200, Daniel Lezcano wrote:
>> On 6/9/26 13:30, Dmitry Baryshkov wrote:
>>> On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>
>>>> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
>>>> cooling devices backed by remote subsystems.
>>>>
>>>> On several Qualcomm platforms, remote processors (for example modem and
>>>> CDSP) expose thermal mitigation controls through the TMD QMI service.
>>>> Client drivers need a way to discover that service, map DT thermal
>>>> mitigation endpoints to cooling devices, and forward cooling state
>>>> updates to the remote subsystem.
>>>>
>>>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>
>>> Wrong SoB chain.
>>
>> I think Gaurav wanted to reflect the changes did a back and forth between
>> us, so I ended up in the delivery path somehow. I guess adding
>> Co-developped-by should fix the SoB but won't reflect Gaurav and Casey did
>> actually most of the work. So I'm fine if we remove my SoB to fix the chain
> 
> Anyway, Gaurav's SoB should be the last one (and it should be preceeded
> by the CdB tag)

Ah yes, right :)

