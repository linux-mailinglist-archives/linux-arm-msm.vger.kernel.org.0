Return-Path: <linux-arm-msm+bounces-104997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C8XJ8S18GlwXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:27:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4A485D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF0A318084B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD9F3F54D4;
	Tue, 28 Apr 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH7BX+o0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ih8sujDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4463AEF23
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381405; cv=none; b=YjQUVA6yETdwjIhiSI/RuVZJ7Q0Qjuyh8UTv/gev5C5w2ercXzWImRfzzjz9AJcEOb/SwHDnUlfLbQpdp++LKRRmyJ+RLrqISz8IGdfcrdFjSy9+4YK2dl0U2ghH72vqGDKQkWGNPn6DW8FVv1ALwqWyt2RiihnC9oNp1p7VSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381405; c=relaxed/simple;
	bh=po8mFBivPmCgbXtyoSG2kBNNAWPWRcQV/8vWooE8lBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATCq99/Af0BX7gyCLRkWfuQWNwq3gE2/H+COCFpEb1ouPADXdn3WUGFen4tqkVIfNb89cNxzXFLlifc5c+rMXaQZe//cChap4972NPDnd8hMoTZrnLNBZTHXd6NFYgsjZAd76VsecwQ7ekAqhHECu+PC4sm4GSGbciXhN55Dy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gH7BX+o0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ih8sujDq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA2tlG984988
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=; b=gH7BX+o043XO51CZ
	eww7aZ4/jYejBslFXpdGy3jbqDCLi6bvJh23fkCh9dlEXnkG0cfqEdSX5VGs120d
	4Q8r8LvgVmwF7AYT1PyEmXMM3SHUPiAC2sxv8VM9Y3RAPmN6PNZdUDFj5euQ7wRu
	KbwpW46muq7TjRYRsb6Jd4fsTYjlieh1TM9aQY1S767SMquLuzQn/RbDm1F2yq43
	tROOpXtsuq73A1zLvD8fECk4A04GrzuuIa89D0qwyphjnU9V/Jw/wIaloeSVbPA6
	kXPtXN+ekEBEF5Do3gfP+Gpjj06Tw9VYTRoKOAIy9qATyLBqTFdFEqL0MHy+svQ+
	WxaxNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2rnnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:03:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so13688925b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381401; x=1777986201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=;
        b=Ih8sujDqvueALRseB19LcbqTPAiGsksklybJDX02qyqUXSa4GXIW1tAnV9u14/3sH3
         T5w+FTGgJzdkdr/FN6AM5G8mjoF23vG9cz1SvXPHzUkc2mNeo/DbTGIwnWiFt8FUCuep
         uG1UrL19qw1RPE7IiAxLdZPJoFqsieG0seULKGYlJ6fHlwh8LL7uxxStkTaQj6sD3gZc
         fSkNrjF8n7aG5CfUpaEADn8GsQARd0oSIokkSI1c2Iuze2kIXYW37EE2B6NxDUaz+r7t
         8FPkq/TOpxS/1L1iOxsE2xvrHH+a1YwLydSaMKq10L9Nez3Qvg74yRXfkm2V4CPckHya
         p2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381401; x=1777986201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=;
        b=ngwE6P6oWLbwTYsoAdnwcKF96r7HHRdfthZMeIHzl4EXmuCzF9nuzXkg3IRWQoz7e5
         JBdLF/Eb23AtcuGBntKmiTsRgdSREKMOdo+meNwtiLEoiBATgyHL2HXtiBBlSdbEx+zw
         dZXaWZ2kMXuHhp9eqkyswkxBm3TMFej+bqUpCbqIbP/04Y9g1JY6f7jzuk8IrKJqommV
         hR8/tfFeXOrtPv9TziIJhDOJfr72FTVvSmLR5oK39DfEiJVjOhZCjnNQrta9RarAtRoa
         P65xHF2KMimRqZlouZxQMktQlJaZgXZN7IyVIH05msTv11LotwSh88S6smY/K5OWBfMp
         tXEg==
X-Forwarded-Encrypted: i=1; AFNElJ8iHEAWVpgc6HhNkTWWO2/Gmnmx00wuPwtzV25v4xuQuxcHz1WaR1JwwRCD9nuNUxffSxr9ROYo18modYKa@vger.kernel.org
X-Gm-Message-State: AOJu0YyMK55SKRgcbb6BP5GWkohoLl0GH0q+SzmMmue6AO36A3Mi31/9
	tToHkbZNgUpD7+3Q0BFPUu4GyMJaD2O1S0633kxBC6SaNTfBvLijJCfsCkSrlBDRxkC8dXyl1a4
	5g5h1tL68YyLYCHmzym14dkR0OSYEcUdJDGtin0h+oLBRC0BC9qkuoJF16sVQMzBjm5Mg
X-Gm-Gg: AeBDieu3DtO18QJe1+p/kSng+RXE2n5TNwO37w79Iwt6DvP7hkOkPPc90Oweg7mBAwe
	uJoMef0w0ha7kKLXtYrBKFHyfAYT2Qc7G1GMWlBXrwL/tFaLCn6UC4kyM3Kn9/esb5o1Os1Dl0M
	NWbT6SC0oeKesDzeDBWgISnoGSch1xHLYfkH5wVw/LxnpnkwbGoqdCjA/M6R0zdmC2sssSkbxMB
	A+QXBrmXyn3RJWavr8HxKG9K3U2EonF82nxrahISaGdva1K8cpt/cYoUYyUgghvkUHzz0M6QQ3Y
	dShyz2oZTkrKbJPiQzcly4qYVZAWbuGlaYxY5/IZ70dfxpKSdOFg21bNtwXbNNCpe6WfuYTPuUo
	0q+LATDT8T8IooYWEwXD3MiZOiZOjvKcP1mPFPMyzgjXfCmxqA2L0ImuGfDzUUGCbQxQ=
X-Received: by 2002:a05:6a00:3691:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-834ddb28060mr3248373b3a.14.1777381400957;
        Tue, 28 Apr 2026 06:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:3691:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-834ddb28060mr3248246b3a.14.1777381400102;
        Tue, 28 Apr 2026 06:03:20 -0700 (PDT)
Received: from [10.218.41.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf7eaaasm2531210b3a.57.2026.04.28.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:03:19 -0700 (PDT)
Message-ID: <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:33:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0b019 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PlKOg72wQhDXdNgDaE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Z9JpFPUG8IG2VBXFkk1V1TjVu31AUwci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMSBTYWx0ZWRfX7d6Umj52CQvt
 HOIHnQjh8RXlB1gwj2ojcpW52UB2qMvd/H4kApQz2UxknA9MiTH5IvAT3DYq8YBBEWN9GWo+9aI
 jcaXxSPvU1ZwHoCvpILTBnIVFUNSXFM3ZovUn+aclDmAkQz6N+O9uE12vZR7rkEof6eeTw8xCRw
 RDiH7ktlqXrYGb8ry5Mt7mIJSXap9lbHKBxrZzN3owZqmrrq7e927Uskf3xRRf6CDg8GnnqnAbP
 KPPhfgJnBHGci0kaCGv3Xvwc2N144H1jwVkH32prbSKWzQeFuUWikOHLTJ5bkwFhePJGk0qmigq
 SAvm5olGzmB0lGPGJPHC5RF2SLWRzlQbafHzBrqQpdjHcODxMFcHiNBTYwEWPCsD1s6SiujTOr5
 wQqNSNpXW6byeHXfkFIehu6bduoOokd/fOWlOJ32MdjXp+EQlxG+TFbzc64jSUDFKAE9XzH2Rk5
 zoxqgu2uHaKaVgjKYBg==
X-Proofpoint-GUID: Z9JpFPUG8IG2VBXFkk1V1TjVu31AUwci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280121
X-Rspamd-Queue-Id: 2FD4A485D2E
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-104997-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
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



On 28-04-2026 18:21, Bartosz Golaszewski wrote:
> On Tue, Apr 28, 2026 at 2:18 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
>>> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
>>> <shivendra.pratap@oss.qualcomm.com> said:
>>>> MFD core has no way to register a child device using an explicit firmware
>>>> node. This prevents drivers from registering child nodes when those nodes
>>>> do not define a compatible string. One such example is the PSCI
>>>> "reboot-mode" node, which omits a compatible string as it describes
>>>> boot-states provided by the underlying firmware.
>>>>
>>>> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
>>>> child device during registration when no firmware node is already assigned.
>>>>
>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>> ---
>>>
>>> In the following patch you use this and violate the supposed constness of
>>> MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
>>> prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
>>> indicate to MFD core that - in case no fwnode was assigned from other sources:
>>> DT or software node - it should reuse the parent MFD device's node.
>>
>> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
>> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
>> to psci node.
>>
>> But we want dev->of_node to point to "reboot-mode" node. This may need
>> an explicit assignment again of of_node?
>>
> 
> Ah, sorry you're right. I'd like to avoid having to modify the
> mfd_cell entry at run-time if possible.
> 
> How about a callback in mfd_cell like:
> 
> struct fwnode_handle *(*get_fwnode)(struct device *parent);
> 
> If set, it would be called from MFD core and would do the name lookup
> and return the fwnode which would then be assigned to the cell device?

sure. thanks. We can make it a callback from MFD core.

thanks,
Shivendra

