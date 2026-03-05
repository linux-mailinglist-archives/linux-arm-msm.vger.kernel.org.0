Return-Path: <linux-arm-msm+bounces-95672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IKdIn+4qWlEDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:08:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACB215DD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EE8D30B9F84
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 17:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368733DFC75;
	Thu,  5 Mar 2026 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4bEybrX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Typ50wuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16F29A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730432; cv=none; b=d4O3xeRSe4o0V4yGRnaKMlStvIZyMON5MOvn7qab9vvcFtyLaSuBSgCwRn+aQ6JcEnqOlfeBEjRmVEHC7E5iyza5OfjYxJAIrLHR0mBOMrv4rfAlVNUPBvSliJD9rJcxyv6va8idfJ5DENBiS0dwjAupEoWO2sdg11d9mpoHCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730432; c=relaxed/simple;
	bh=pgP0q4kVsHFcrHbvYtzYON7ox6KLWsq/00U7ee8fSJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+a0DC6LhJICThwddnudijS8Awp0dkyoVeeDM0WqacJy8VVs8vS8kxVruMLVnrZffSBPhmZNQzto9/gBqRlmXgVuFVeG6JT5xu5TD+8fdyaYWo19CGoKGvq0pQP3kgFt5GPmFrXHbe8iHqQW+MocU1WL+VwnZ48s41A68EeylJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4bEybrX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Typ50wuy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFwe0456259
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 17:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=; b=a4bEybrXskoGZv0G
	azDDjfpL2IOffTbrcBuFG67SPotuiTOys4t+8fwGZFuXAThGyia+MdFPamiAnnkT
	StMJYJp2iyF90+1NwpdnGs78OqSctI1r60JSwVcog+/aLGd44RS4ysAda3s0lxqQ
	klZ/sO1w1Uec0bLVnGgh6xrBTPw+tZmyopB25LlZvQYB2mG8SUoS8GLMK2bU/NhQ
	rkuJpbieG8FfRmrqYDDqq6vEH8BYNzpwVSjJnvkgwkebOqqiUpqe8dejBshev8NJ
	zAVC02J3kIE3bAHpvFLVsT3d+xAg1u+TQF6Dx4lQFS98Wr+QdvpIbr1K+gr5ovi1
	Z9rqYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wm3vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 17:07:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso6892158a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772730428; x=1773335228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=;
        b=Typ50wuySwlOR5roqdDNG8zr4zyB9KbOQ2f6J0KTSizJM/A2Q/ROXAJ7E3O40STX6z
         Uh9x8ego73/dseTIQTtNIK5nAmHfYtcEnCKQGoR88KwmmFXrQjmZCjmxToGCW2IE8AjE
         05LPO8y7WEuEffHzoDzgSmNLnmwW4PWlF4ahpu/D+5q0owd09V7rnKr3Io9HP/YSBOcK
         DXSiDJ0yyoerM1gATDTBOpShW0nFTsxySPjDX69tkEtfnGLvHsfJ/3bqIHcSNMV0hwx9
         DKspq49g62iIXIXYC5yubTDWMal2E/KG1l2gxse7hNAocGJmTQzRcbnucf22d2yxjWLK
         SpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730428; x=1773335228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=;
        b=anVhpfsqFcvkdAUP0DtdNV7II53com665g8qRA3LISm4D93Wi2I3GdNWkPo6J7J0Ob
         z6x9ElUISIwAorcvGLoq7zPE8mKVggynIuMqqDUM3IGUhl9Fpl6OQGYsNXpmt9+XJgta
         TToR1mx0JItBKsSpvRg+xhkhiBo6cypViABw679P3dkBd7Xb70ZVQJKppmi4FQpAHIuF
         TsQVPTpSl+j5r8GVNuQveiTjD5oPBAy5CI8cGgkFJwS/SMUK15AAbPFMgjqA5UmRzxWq
         8VgNGvlCtXKYSQDYetDkTkrcsxcRwHVVbjmUEepnwECGWG1p4EM6GA2OXTxRydndyNIz
         0U5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU14VeSZi4jn6Kp56w51tlOfb1QryFonuvFL3KaLtH+uIwoMdbGiqvdZKGiY491kfZ2RUNvBWFz4Xgwyj6W@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNeEK6IvJNUN84v3bdbAAjiyBq/yqtkgovUJFCuFqhhHxUBub
	6xhC45ZAKIC/mO1i+vz21lOMzJGLHdN1PFOWOF1WaBnvRffHbPFnFF7fsTAfOsGEjAHYNChrSW/
	a9CPVl8bptMaHEXK3Z8aRpuyHf2NrWv6ow4GzY6CaktNf83CeEoK5BuehkI+zF105Ez+F
X-Gm-Gg: ATEYQzwt37mX1etQ8ZkoseP6LZyb021mv4kpaWqV4mAKZyZ38IMR3lp06PLDb14zWCD
	tmUzrypo7IfdgoDRgN0OS57FMtXDdDJbD9ABSVzjzaRYD3EHS3xzqZCD97349MbVyWZ045lytF8
	AT6ZeWjj0vaxplmBvC1u4wErUAiW1pUUJxiZ1yWgo+dIAR0vmMvOVsd+RdSDq9Gb2tCOzH27Oew
	fQldAAnaYEm3TZHuvR7ihW6R6qGB/d0QqiApA8SnkVJqbaXI7pgyzKgSE0KHJ/HVPlzRYzeuCZ+
	EBfVjp/z2W4NhIhr1nDVHFg5yZDqCIm8AoajBy1PNEil/RxT4piv0003d53FnbWVQKNB2EuswiK
	5I4MYqmDiVMPPv8wC5ieZjtOkZy+bJJaczweVgc2oHDUN4SITvjuxfJ4=
X-Received: by 2002:a17:90b:3e4c:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359bb45b0b8mr219571a91.33.1772730427685;
        Thu, 05 Mar 2026 09:07:07 -0800 (PST)
X-Received: by 2002:a17:90b:3e4c:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359bb45b0b8mr219498a91.33.1772730426982;
        Thu, 05 Mar 2026 09:07:06 -0800 (PST)
Received: from [192.168.29.31] ([49.43.226.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa2c02casm1708265a91.8.2026.03.05.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 09:07:06 -0800 (PST)
Message-ID: <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 22:36:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 51mpopconpRgegmCg4dvF8Uwv1bo_0KE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEzOSBTYWx0ZWRfXzQ2NpVF/i+oO
 iyRvwWsGrg4fehKm5wNVO1bWZ7rFKprpwDLzS0EoB+wfWdwD3su5ZH1Vozc22ngqq/nAp+urzQg
 3II49TVdh9JefmVYAu7YOOiZQqNvjdy5UKobbitm95bWWkyqMnCWI/CljtZRTfK8qImv+Fd2S+N
 2tJ59jHTGiezGd7ZcjSabiIDWx/mQpKTgLvJCJcwf3LXjo72trXAhdRS75lpglf0bLQYH7YLQFx
 KPHk0rWtG8Gxy3e2G+9Uyamv6kVTVYVYZy1qOIY9jBOliIWT8MNpyn5hs5w8t7JeeCllqlmY02a
 1LOr13aqHZYhllDh2rQbVYHd1Ib33hO3klUn7rCO9vcYCenFyM1O+WU9kAPcHoRCX9p8Rm2k3cw
 fjPAsKL5D6b32YxFsCEEdON5TYaugLQaFbdAAdI1kyl7SqQ28zrJQ1zBGw243RIxuMTbtPYI1hn
 pnWs5eFOffZpINSyvkA==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9b83d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=mvMbtr4cKWCpcPtdaitTtQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xSGJYzCLABdN7Qz2ucIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 51mpopconpRgegmCg4dvF8Uwv1bo_0KE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050139
X-Rspamd-Queue-Id: 32ACB215DD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.infradead.org,arndb.de,arm.com,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-95672-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 05-03-2026 15:32, Bartosz Golaszewski wrote:
> On Wed, 4 Mar 2026 19:03:06 +0100, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like COLD reset, ARCH WARM
>> reset, vendor-specific resets. Currently there is no common driver that
>> handles all supported psci resets at one place. Additionally, there is

[snip..]

>> +static int psci_reboot_mode_register_device(struct faux_device *fdev)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	int ret;
>> +
>> +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
> 
> Have you verified that the faux device is actually getting bound? This is not
> probe(), you don't supply any faux operations when calling faux_device_create().

yes. It was verified. faux device got created like below and the 
end-to-end use-cases are also working fine.

few logs from device:
--
# find / -name psci-reboot-mode
/sys/devices/faux/psci-reboot-mode
/sys/bus/faux/devices/psci-reboot-mode
/sys/bus/faux/drivers/faux_driver/psci-reboot-mode

# ls ./sys/devices/faux/psci-reboot-mode
driver     subsystem  uevent

--

> 
> You should pass the address of this function in faux_device_ops instead of
> calling it directly.

In last patch, we were using a probe function. As faux_device_create, 
calls the probe from its internal operations, "of_node" can only be 
assigned from inside of faux device probe.

As our primary requirement is to assign reboot-mode of_node to the faux 
device, thought to make it this way. (As we did not want to assign it 
inside the faux device probe).

thanks,
Shivendra

