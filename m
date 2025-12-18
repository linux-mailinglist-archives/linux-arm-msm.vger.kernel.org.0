Return-Path: <linux-arm-msm+bounces-85678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D3CCB983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC3F7300CD54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B043164A9;
	Thu, 18 Dec 2025 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeSRamcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsR/v/GD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8B316917
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057038; cv=none; b=P0I919zeCYWfj5T8elLDSq0RJBb6WGHgNeBeifrkAm5jzom9wnKxjlUQbs7BBvhLGT7iVX/qRVA3WGreBIKbxshdosbsEFIOoNgGsg8ZcA2ezULKpGjng6XnJoyzMq9Ji7OAlOEvmrsKrTpJm8+5dG5sfSNL9Vx4uWl6B2jplZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057038; c=relaxed/simple;
	bh=hs3jI0CO+N8F+Wozmcv4hy1NcL+3H2sHoU4lkDZA+qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8nGldXprgrW7wD1OFI9gNYvGGdk90Q38C/Qa4snBoFY8qb20Gc/3kk0CP05dbCUrFJcpMwFCRwNgwv/9Yc6KfAO2J0mJ6jngDfpZD0VIAh8nGHhZk6zFwi3a8gfJrTsfrmHPuq6uqeMoGWLAXjuR8sFWJsqawB8OIav476f/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeSRamcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsR/v/GD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8r78q3447018
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XM3PjRRkgJDLVtvgBlf1yGGi/oXyJmhRngXHmv4Ni6M=; b=KeSRamcO8HYzb+Jd
	8DbYNGEtSh2mqQ2eIkctswsma5t61Lp7RqIvxNZPNCWCa9GWlyyIbx6LvXVB26RV
	x2GH4wxtBM+eu5MtYUy1N2FLrsQ5pYIM0sf0ZeRXFfAKE4N8CB+a07QIuMLY/JpW
	eWnOdXkjw0qubFHlLebkG73GKf7K5gfpAshYyGU5+9Ow2fE2DpnL9CZXgTejdPLI
	hw5i3MMvNGKL2ySdGFAlwk0l9+dDehUH9ToIyBZMiOYmivS2hapgNRp/XBGeGCWx
	qd4sVpFR+8lqBeqWvyhcLn9Q1S4fX3j6ngfIV12Udv445I+UJ6z5x0kwiVSEBme9
	iWXp+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4egb8j9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:23:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88653c1bab5so1958076d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 03:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766057033; x=1766661833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XM3PjRRkgJDLVtvgBlf1yGGi/oXyJmhRngXHmv4Ni6M=;
        b=WsR/v/GDHiu/TOvS6JjBvA3UUJsx5Sfj3wN2PwRtZX+qMUNDHoXNbaQ+XAbbK/qKFU
         jSSsetyt3x3wP0HCWt8h0bknjW3tlRbF6srOX0YIpR5D1tjj0jsLRyJJtf3cZWVhdJgW
         EaA13MiQLsAEKcISfPOPU5UUeFZUKTxjrRdOb+xF5ZmpNfmjvwBhMADByzv+ULMZBOKs
         1xsuf86mLf0N8usM1Rg4Eg88V9m8bheYwj/ydJcWb6J71Omi2itrHhZ3y2FsYVl4lMXN
         tFHf/qS1RsshyLTvwqslvz4gF42hEJMsjxhKD+P5DgCIF1135Vqby13gZsgLOoxQ29sI
         l2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766057033; x=1766661833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XM3PjRRkgJDLVtvgBlf1yGGi/oXyJmhRngXHmv4Ni6M=;
        b=Twge6ZxLLZ17t904DHafqxui+r9F+lF8ftOXorOwmF0wXburgkrdjQN9kfdBnoV8Y7
         prHkXKCTswgV86M45LuivYNP9sLFQ0SVNV+/E8NGl6HsbrGg3fH8VbNGdDy7AZujcuZB
         /F0VPf1wHrn5CBVtR+fGpZXoPm4AC9Mn1Jtzp3CMIx3vK/emAS/JtvvywuYA57SgZRhG
         g4Dzs2+dkioF37GSA1l654HktAj63MXDZDpRfZ/wQcpcrUoQcJ0+Bj57K68HRzo+YzCq
         F9JgLbv3Rnn9UguZHsNMK+l91BPjVMO0p+gH7rvVTKEVeErHPURYFu1+w80hhhjbVNss
         /Sjw==
X-Forwarded-Encrypted: i=1; AJvYcCWr5LKkOGA1VvLnbMibmDZHutZrkwLkME4ui4OxGkdm6lrqpZLX/mBGleYNCfXBJ1Eiz+K3sZqegMzJfEKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx376fVnDmovTuQpNj8+yibTbc/nabz7XeGQ8zhzrc9bDJKVDy0
	iYXUo99W+03+bVonLQwp0MOwv3u68Xk159mwAlwFs2/Xjnduu6dZzLHNKAfz/j0y3VSUVQrkN6+
	iwWJm4LrTMfGiyuPnJlJ6l55RSOVJ3Y3RqlGBx+Vf/4Zr/KO/2Z7d5NM8rDeBB4DGXEKU
X-Gm-Gg: AY/fxX6LB9qCLLX8iZ7GF1ZdUkA0NObvuCNV1mNDuANyUgdB/B6UW1lRrsLsZQ0u+WC
	gqD2T4VeGqctC7IEwsPUy4bJQv8msAN+11OchC1FJx+qVgpg2UTfHEqI9xh+iI+l5z4xqu9LpUZ
	ZbNYnUnDzCBV38yLwdx4J+s/uePgvbyDm7x9lGXuIvOjSDT9baXzdA1UBsDt9KImfDtnsPBk/KG
	s5c7UqYJs878l/IV/Vc7vHL4Brk3rBEbYywckLKJ1ockhXO2fRC8A6+iaWZ/t9lyXO9dBet3rmC
	pL6pyoRsGDFWo+MiFFqIpAo0dmmOwlu72KuYKOxTQzVAWiTgAfkxXcV06xIbgVEMHJ8SueUIfpV
	RTQl/UFtxSBi9fdL5igiBLqg4lUbB2b4ivflOSIjet1svcKz0+dN8OHgCsEewatXaTQ==
X-Received: by 2002:a05:6214:2023:b0:882:63cf:3970 with SMTP id 6a1803df08f44-88c9770bd12mr18182316d6.1.1766057033616;
        Thu, 18 Dec 2025 03:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/tvDYCoy3mFqOPD7fGTgiVRBpPOULT1Lah31cAzxTWH9nDj15BUCPMDBDM0NtBT/HmoVqzg==
X-Received: by 2002:a05:6214:2023:b0:882:63cf:3970 with SMTP id 6a1803df08f44-88c9770bd12mr18182046d6.1.1766057033159;
        Thu, 18 Dec 2025 03:23:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585d1d61sm2335297a12.9.2025.12.18.03.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 03:23:52 -0800 (PST)
Message-ID: <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 12:23:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>,
        barnabas.czeman@mainlining.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5MyBTYWx0ZWRfX4tT/mj/kfHc8
 HZ6eWXX3ASwe3KyTlbBb81nhPLHhOBqWvzKlVwRlsw3dRsydeBIx78Tzk38K+SZVpzeLgiT3Du9
 8+jYtF+Jk2Xpx5IfvAeOSIqvXj/PWKN9YHFa5Ft9b/ME6OwifZb2u3ZCOfObEVzYvjM3s+VPNV9
 uALsmQJeqbSYDEt0xX7h4Ts6wMCdOEhwYoJej82T4t2IuSR+H6BzUG3JU5jETiHCNaq5OrzLP/s
 DOp7Pg/phyEuF4ZTEMOeYW9ofpRsyhcavL75WDeiMHymZItiafQ000lLfOnlhW503VEEX5rvjS+
 paXkhGU/EF1k4dp/4btFJczZ3jzACOG5SfbiaOGGYaLM0pcU1xNo9kLtAdL4yTliM3FPcLxxxCF
 n8usY48L3GrT/ESDcq6SJ/0gGGyzVw==
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6943e44a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=cLwkmEU5_4-cEt2YZAUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: X5zUmZC_U-eY-12fqslNitLZQQi7aSlQ
X-Proofpoint-ORIG-GUID: X5zUmZC_U-eY-12fqslNitLZQQi7aSlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180093

On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
>> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
>>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
>>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
>>> mature enough, so it's no longer sensible to keep them enabled in the
>>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
>>> string. Drop support for the MDP5 3.x genration inside the MDP5
>>> driver and migrate those to the DPU driver only.
>>>
>>> Note: this will break if one uses the DT generated before v6.3 as they
>>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
>>> SDM660. However granted that we had two LTS releases inbetween I don't
>>> think it is an issue.
>>>
>>
>> I've retested DPU driver on our downstream release based on 6.18 (by
>> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
>> at my disposal, and I can confirm DPU driver working fine an all SDM660,
>> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
>> (Sony Xperia XA2):
> 
> Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
> your SDM636 / SDM660 using CMD or video panel?
> 
>>
>> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
>> dsi_ops [msm])
>> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
>> opp-supp-hw 0x4
>> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
>> a3xx_ops [msm])
>> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
>> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
>> on minor 1
>> ...
>> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>> error]enc33 intf1 ctl start interrupt wait failed
>> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>> commit done returned -22
>> ...
>> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>> error]enc33 intf1 ctl start interrupt wait failed
>> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>> commit done returned -22
>>
>> Which results in horrendous ~3-5 fps in shell.
>>
>> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
>> commit done returned -22" is repeated few times per second whenever
>> the display is turned on, and stops when it's turned off.
>>
>> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
> 
> It's interesting. Would you please capture the devcoredump for the
> platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
> and top_0.
> 
> Also, as a debugging check, would you mind patching
> dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
> dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
> any differences for CTL_START and similar registers, but it will take
> some time.
> 
>> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
>> tricks to work around GPU issues.
>>
>> P.S. I have not yet tested MSM8998, but I can try if required
> 
> As far as I remember, MDP5 on MSM8998 has never been wired (as in never
> committed to the DTSI). Angelo has enabled and Freebox people have
> tested DPU on MSM8998, but I think it was limited to video / HDMI
> usecases.

I think we poked at both, back in the day (tm) and DPU worked on msm8998-
sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
(due to a register field not existing on <845?)

https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022

FYI panel wiring:

https://github.com/SoMainline/linux/commit/88f276e81cea0f7496d3f92cd731f27615cfa703

+Marijn may know more

Konrad

