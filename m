Return-Path: <linux-arm-msm+bounces-78028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99054BF1E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8ECC24E1FBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032F71DF270;
	Mon, 20 Oct 2025 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwygVMAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DABF2144C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971082; cv=none; b=CD6XNVSxfyimrFU8Cmvp63JzCTa+MJtAEVz47foMHZWqg90H+7QI6bGD2kv9rgmsu2WpcSbAdTaEAl8yW4zH4eZ5proAcHGKNtBpBsfxvyBwlRh1scVB6yhE14CNHjxIAtgmEUrrctLJY2o63MKT5xcQ5+EyPQEGcyV+SidTX9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971082; c=relaxed/simple;
	bh=g7vm66uFoBWXERlnSFU9QSzM2MNBZ6eB9epOObSdlZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejM7/uxjbmTc4u8jLg8jT18vvjtHqkPIMw+fUitPofQCPybLBQzWDthb9MfzrMPuMnZlJpxSnmw7yZj3k1iQvpT4lbVk1WouRv7h05Fm5RvT990/nrgcJwcToP9XEsHDSXtDz+oafWlFs9xrnROey1Hbh9J98DUwfM/zHr30UXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwygVMAy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCdN2c031516
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3UWjAiIBrgLau2Sy8mogzZBA0wuWkqgwhg9kzGevk+0=; b=FwygVMAyWc+zuQTX
	Hv71MGzGyRMmHDvdinBNXZdut3E5ZuYTkSPocn+IXkEkuCSd97ehvd00YK3/YsOO
	cNylfGudOSyUN9Wg1wKS/GqRIG4/JcBFreXLwCaY1XzqJwIbfKBK4YCEv680AnCI
	SreQmRw4pugK51j1wkuX0xfOX9IJMYlRpEPYM3bzAcC0htHXvs8AZg99nmsF42CO
	jtVjAdxMgSZ1uI0gQXSj6xPwhU7zqHKU10ZSseXPjrpF0gxwKiRIiW7ERqyiMSD2
	PmtSrMNSAY+w+qCgMVOygEm63B/Jz7cepvEHz/DqLgBVOEakUPwFrGN3cOkGYYco
	9tpXJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3984ye6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:37:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bf4ed75beso166446806d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971079; x=1761575879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UWjAiIBrgLau2Sy8mogzZBA0wuWkqgwhg9kzGevk+0=;
        b=FLLvMW5lixKpdrwszJ6OxaepyD0e1+BUM2xxWYKrluCJYsUOFnTfhoIFkYYfgriTkK
         L0SpAA8g6TSngvEkyWS7Q4jL8VQqkjA9Ks++RRQaGKmlVb097QFUcT1RGk+lNIoBUv6C
         fjCOFuEHlpptlUgu+R/4wUxnFH1SkXCAyrqHGALp0leI5b1x0Wqt6W4StNC3tnEssiu+
         BpXjRJfoALJwyQXRWrNJYEM2lO466jTLhCkB9cAW9LsBTLqLPKmZT6vsolLQRvcc9n7z
         0U3asrF7VEPA/PUkJlx8cldO/4h40x8Wg5f/73OmFDmpYyJmPd7oW5AV1fgr1s4GaJ1X
         gmRw==
X-Forwarded-Encrypted: i=1; AJvYcCVnsUGooSeJEy0ZZD+lfSDQnwMyRZEDQh6HYLf/8loxPDXe26EJKl9kfOBPIbfL24G69rOlzCE2IN5ZtWNh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9ime3qY7vliygdeV1P6/KJqb7Frrwr2+/NjhBk+o01NQIXgr
	3wR5+CokMoZb4ieVkcw+0E0aayhh51etErEXvE8RaGfAzQNO2XEFNP20zBP33e0Bn57PFQGOyMs
	4gt/WUNxbTnQgDD7Ybjxf3ZplKLLjjggssJtBl0V/MqFQFPQhwZ7awvDecivGkPYtJH6E
X-Gm-Gg: ASbGncufhnrIXhneCdA2L36j67BYNZLA2+u4wrPQfB1GtFlfFLiM6JplcIIrYleyxHI
	99fjlVMhkI96IzxvemYM6kb2yeKhziaCwLYJZTrZ+Z67fAsgE40VhDDF3/K5t7sIn0XoNv7aaAP
	9OQI5c/Fj3mlsdceeg7S/bhIIBqZkDWApORCf7Eia6nWMeC0DWNlZZ/4HWLojJfymDDmpMEWtaX
	iXP+fReZ8gEbpnZzxrWzv4pVCQBTUn+E5UrG6JYcxW3qDsN74NS9wJVBf4IN76auViYjWbXYQXs
	3K3sIXappN0FafGU/m8e7oMZheB39487bxb8mAhxpjx4XG4ldMsL8pFmqDmgFcXdnsMFJm1ujso
	++K3242TcKC8/jN8+al85qM56KA==
X-Received: by 2002:ac8:5988:0:b0:4e8:b979:c7ca with SMTP id d75a77b69052e-4e8b979cc56mr65036281cf.18.1760971078973;
        Mon, 20 Oct 2025 07:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1lzeMW875NTSCbMzwfc5cSS58/qFqK7T2evBfqjYBnU2AF8O4gAA+d8fm7iX72aR+ZS5uhg==
X-Received: by 2002:ac8:5988:0:b0:4e8:b979:c7ca with SMTP id d75a77b69052e-4e8b979cc56mr65035961cf.18.1760971078497;
        Mon, 20 Oct 2025 07:37:58 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427ea5a1056sm15657051f8f.2.2025.10.20.07.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:37:58 -0700 (PDT)
Message-ID: <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:37:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f64947 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dtEi0ryFqlHHO-XquR8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX2IwQp+QM54we
 Qr3psQ80+0131mqbvya8Ff5H46fbRH7YVVtpnI/hV+ht3UDeaT1RtHuh9Ls3WMJd2O1yWFU5SYe
 g8xUvg/4Qh3Mr4BrwTOalkyP/Iwz4lzJgCA35GdLyS4bYyAKEY+Be4Lakk/7jezg3+c6GFygNkv
 YEjuqsJ7FCEN+5hgc/1wM4lLh+kTLXkXELXZ3wdnttvx2BS2K4BQ+Ll57k2oO8SFWOl7bsFeMaR
 UGadeZ+44T7uII6F4wBnaO6Bm/jlVsprlCNoddQq93B2SAesP2qz442iKQxrTcBHdTFh6GJhZDS
 QINVQtWV1mbY+YLeAbW2RjWD+ZNdjZumJVnm3XqtyyY5ZwQ1SfNA5NZ9l1dQtKuA4Z2n+FUCUcw
 zJ/P0D3XjAJ2BwPJg1N6lNl9bVyAGA==
X-Proofpoint-GUID: UIIij_2mKsHo-SooiaXQhh8mZwISLE_J
X-Proofpoint-ORIG-GUID: UIIij_2mKsHo-SooiaXQhh8mZwISLE_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025

On 10/20/25 3:35 PM, Alexey Klimov wrote:
> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>> For record path, multiple read requests are queued to dsp in advance.
>> However when data stream is closed, the pending read requests are rejected
>> by the dsp and a response is sent to the driver, this case is not handled
>> in the driver resulting in errors like below
>>
>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>
>> This is same for both write and eos.
>>
>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>
>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> I was also reporting this error months ago.
> Thanks for fixing this.
> 
> FWIW there is also DSP timeout error on Audioreach-based platforms.
there should be only one for SPF get state command.

qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode

This is expected as we are checking for DSP readiness and it will
timeout if the dsp is not ready.

--srini



> 
> Thanks,
> Alexey Klimov


