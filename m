Return-Path: <linux-arm-msm+bounces-92332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMExL+UAimluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:44:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15D11210C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE773028341
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825EC37FF69;
	Mon,  9 Feb 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQtse8AY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcuKkMbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D137FF63
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651834; cv=none; b=HemSiL2hduRmbawl8owH55kGU18UY29qE38NVSnFbb56GEWhgAd8dBszYJTLzoiOKRd/SMp3ANAMr7aZvb9r79yHKzimLUtqVEU9AU7/YfIJOud/6sgzYUeP3kIic9OcjcLr2gcrHosqbfx3wn2MUCC65aN4yNpo63lUkw8xvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651834; c=relaxed/simple;
	bh=pejDHyWUpgYcyOlJ64FLXWGKSBF60+zMdKwBdwSIais=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hz/tEEX3RLpyBTfULy+V8I0vGTQQHdMoqHqb7mtSnRQVQ7iubE1ryfK2uYEwH3OTnIdTCbBzQBtSNwuGwDpxQuutzj8D1aVRoopBpVmozRyp+GmqOo+EFFz5gDgmZbHy/4vNJcqqz9qpyFzN6IRusFfxWOkquYC5aWM91rwi1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQtse8AY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcuKkMbb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619B92DL1633532
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 15:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOtvKz5XsYK8DeBlcq3YrSmTR4LSM+UOfrV33PKISmk=; b=FQtse8AYZRVjF3UU
	JSgByOh9HyACVFbNxBxv/6j6M9BMPiXtUmOTYEz9Ua+MPkIqPMRNRM/M35JneDkW
	oPtG8956EBfUH1b5yFZGymhkXrqhhrosF4wDkmaOKhAVZnuh8b3NtuXzEzQoLYzD
	OC3Zb4ofdv6im6MM8ummEos1dyVwNH3UYm34BYkg+RYFdsRx3QTnTmKLT51CGjez
	dGmTccjZOwXb03NLp0fPEb8tcCIU3U40ptYsWjr35tjn8QxxdQhsfKqzffjYxG2S
	+3Bb7dOpmyuZn8GkP22iMsdG7QxTwMWf2jjxkFlAa3yzSnD3vjnCpetfsgQesINz
	fYn9RQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65c3j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 15:43:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba7e98178fso263297eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770651832; x=1771256632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOtvKz5XsYK8DeBlcq3YrSmTR4LSM+UOfrV33PKISmk=;
        b=HcuKkMbbMZD0JcJ1d8LoqNGMQf04uSD1eOmIUW0RnMIWGJVG/QJrocqOcbjl23JHmA
         IvVCzp8qgzmOqUeoM7G5LlLY327qoiLR4h9/G5DcExmsrUBV+l5xmWlT/ylrDxV0IfVe
         70zJ+oNCrxvGcohYRDc3lT/lUeefGBMEFig89moGjeDEODHm0YI5FWGTWAd/BXB3Hoxe
         13f560iWALRMq/fFkRz/SJ7FHDJX94MkgqQ3+okTQgqLB0odJfLpUKgfFK6FpCLOaK2d
         HYofxajUrJuYQ8ioeFYmKydOW0aYoGsB6aVcR52bnci2Lepb+meQOrHC7WWKEIdCuXrG
         A/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651832; x=1771256632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOtvKz5XsYK8DeBlcq3YrSmTR4LSM+UOfrV33PKISmk=;
        b=h4VHWPjmaRpob6OU/qWQVWHIgXAe5T9bQvywkFZHI3Zzcs8shG1PTPKE4IElnstyl+
         c3VyvgjVfMpmrprMUTjXOE0RtqHrJLwJd8qoF7VWIULuof2SsZpIe3E42/mAs/DBoANZ
         APnY9XrY9gLOLx4ZuUqJZVha0bhj3zA9YTqsQz2HnFJCJKYJh+uj3V7bO107kdkMKlZS
         /1PybNftkqxbnwiY4WdP6pruUguW+i1Lx7JvQCumPTHn7DPjlfXwECumF6703NRa3jd/
         NX7XgUyl2tJX0l1JsVpYmsYMnicer/wh+YKnzcE0hH7R5e/NlJgipEMl7lveVjC5+j5z
         97FA==
X-Forwarded-Encrypted: i=1; AJvYcCUvxRQpP7tswuWqGZnQhsV6i8QgFVcatUmv9X/d5qWHWha5p76VJw/9WSPbi2pCAUmUCb/w5Po7dCF2+6mo@vger.kernel.org
X-Gm-Message-State: AOJu0YxEe2ZN0ZvBgO534QzEpguIhT4rp8FHx/+rjOyaa6TrbE3DHxBZ
	wocWhwqOK4PBKAKP+gotC4us6gd0zXs7c4n+e1JsCM+V2Jb9sJma9X/LZ6A+LYh14Qd/BWl6UPb
	PYaoFeEBGuB3jPChAFn6EEXV2+vpfmInB/VbMLcsjTAXpobmrWBSYePdKMVwBdtJxBr+D
X-Gm-Gg: AZuq6aIXEgo6njE179pSl1zIf1JVtxfM64DqWdpPrRbYRAwR1AcvCBOahWKYC0QMhg4
	j7IY1rqGYB+Mt3/MRMR63DXlTkHE0IGxgSVVt51E0AVekz4FJ58jPKKtUudSZv3YPWbJARIG6ud
	9Vb+lxyivHpAvtWHNPFUdRQ/sMhD/WIqjfcq/JD2L1LkzDKjuCTU30K98wl1gSdmNCSxjwIrwJP
	8Y6kdxYClCPnm62YuvglNjoPjpYhDmUW1t/ZF8SQjRZyrAXRFO7Xg5ClCwKxDReGkXBl+uiXekL
	pfQnT8CIExysysDQfPeTfKrDFeaLNryzMvuWx0xijYl5gqWcFIcAO3+3VONBj8wGmd/NLjKib1W
	P0t9Q9vczaCChMkLTS9vSbPFSVTDmYYknvXtD1fQ=
X-Received: by 2002:a05:7300:54a:b0:2ae:5d3b:e1c6 with SMTP id 5a478bee46e88-2b856724153mr5412654eec.21.1770651832084;
        Mon, 09 Feb 2026 07:43:52 -0800 (PST)
X-Received: by 2002:a05:7300:54a:b0:2ae:5d3b:e1c6 with SMTP id 5a478bee46e88-2b856724153mr5412625eec.21.1770651831309;
        Mon, 09 Feb 2026 07:43:51 -0800 (PST)
Received: from [192.168.29.235] ([49.37.135.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b0f624sm8742742eec.14.2026.02.09.07.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 07:43:50 -0800 (PST)
Message-ID: <8fab20ba-9924-48a6-b417-5ebd28b77cd9@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 21:13:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: qualcomm: add
 bindings for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-2-vivek.sahu@oss.qualcomm.com>
 <7cb9a945-651c-426d-8cc7-1ec1174ac68b@kernel.org>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <7cb9a945-651c-426d-8cc7-1ec1174ac68b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=698a00b9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=z/GpFUkVOss2g+jQkJ5YVA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OcUlRVwiwL7_3OGRxjQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: whVYQykcbtvCgk1DF8FtJ7XgGU6fu3X6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEzMiBTYWx0ZWRfXyuk1WylPJATF
 5BPPjPVIiM1zraOIWQphGm5yFx4I9zZGAO6198MNRfiGMAqbJjiXzpm50jqik3EpWOsQYEiWEON
 CQtm/ioWSS6aWYb2lcy6zlAwi8meA3Tv7TWnf8Snikdl9mK5o7Ssw5yZor1tSRFN0ksHbINNUAv
 47IODe7xnpvOnkPyGM1BtRr+mtID4a0orC4TLeCYlCaXc53jnolzu4ptDjcMhjVfAMbGYwouHH3
 NHzgbVkXxam+JvrkKtMOBehJZ5qNPlWcyTuxvmMVKK4DYgHU9pBWtUu7NSKL6spieParArR6CH9
 mSY7kfir/5sD/0d5a3p54+EaFwKe0epmEIS9E6d6lTmzAO05ObJ5sHInROtg6CRZ+fqUzxT+gV7
 0NOYwRsHeu+qa4dASWULggNZGpzsRjScBAatGLGJweiiTXTfIsbtva7gzw+oPuLZoFDOi9Ptvoj
 OHovoJQHOLzbG3QHhRw==
X-Proofpoint-GUID: whVYQykcbtvCgk1DF8FtJ7XgGU6fu3X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92332-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E15D11210C
X-Rspamd-Action: no action


On 2/9/2026 1:37 PM, Krzysztof Kozlowski wrote:
> On 09/02/2026 09:06, Vivek Sahu wrote:
>> QCC2072 is a WiFi/BT connectivity chip.
>> It requires different firmware, so document it as a new compat string.
>>
>> Correct the sorting of other chipsets for better readability.
>>
>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml  | 3 ++-
> There is no such file.
>
> Best regards,
> Krzysztof
The patch is updated on 
"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git" repo 
but it appears that CI build is running on 
"kernel/git/next/linux-next.git" where this file is not present. Let me 
check linux-next branch and see how binding doc file is created. Will 
upload a new patch set based on that.

