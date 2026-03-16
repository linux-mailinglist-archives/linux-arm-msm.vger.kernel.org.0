Return-Path: <linux-arm-msm+bounces-98042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP7DNVWZuGmsgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 00:59:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF512A2229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 00:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1834E30205E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC633783BB;
	Mon, 16 Mar 2026 23:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJR3uFYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Um/mRwLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557037754B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773705555; cv=none; b=JIu7oM7oEPvrH1hxO7mUEoWOCoZqlCth8QTOMmp3sx2Y14EWydIiMrueabaWLReQst0jyNcVJ0VZmBJQpalMlNSii1yCJMxwiY7A+5PGTUF/BKP/4eaIsXRhpnrVDQ9ZNb3sGM5QabckyHUE7qjRQU8O9oHnIRMoZ6HxJrlMJ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773705555; c=relaxed/simple;
	bh=oYI7z8iNeGM+rWeGruiVvP9NSZYISmtijRyIFVFhaWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pI5RRI4DQ4VohNJZugtAXP9LbdThaw+sNkTQwhKPLn/HUAvOIygSrR0z2QDTc5CotiKHLPE1N2njqVwR1IypxnWj2EfVCx6nQL4LXxdfyYA38q2B2QPOwF/RtK/O2D3ghcIT7FVHjXWuw+3i5rwbASrknNpKp5u+/3vNIandlZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJR3uFYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Um/mRwLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GFMpa22314567
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHpf0qlU3IbYn7PC2sJHn8f+KjEEdcZ9cbZSK+YEuC8=; b=dJR3uFYQFKZnaDIq
	rw5NtfZjwfBibMjzmxr0xyCL2SrF5/g59LnZPAZfzBwnxHGx4TfI6Xs+EaJsyUCk
	S53okrqdp89yrRLUrDoglvkqziY5eQTfY5ow6cvmcjojaK8VkKiGyfl3Pwnjp3Zd
	o9CmCRDj4WnJY1RZO2P/tnLgsWwoZaCztARZ5v5N8i7DS24A3TgzHzreqaZatk9u
	PhCnEr2L3wY3QItMuTNqMzTO9EsSmodqv9PKyPejPFb79M+de/PssSm/3pQ3hafE
	ifZ9cT8f0cJhbHVNQb7S+afoodgsJai9EqBaKbS8CLxtDRSmccIaSaDZNHR88Ac3
	0twfiA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf29g1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:59:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5002030eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 16:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773705540; x=1774310340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHpf0qlU3IbYn7PC2sJHn8f+KjEEdcZ9cbZSK+YEuC8=;
        b=Um/mRwLbhpKm9Lr7cvRjPiCfHIesyfJ0Zohbs8QH/eB3QlzHUNK2IQKJjNDizC2NQA
         9BH9NhHutKqQirDWHbJN3y6B24xa+vSNEE2+jCEwPkPSLwFYFWgHhUa+oXgmtAG1pfQR
         47HsDXww2XIivytlYi8EKButYUhMQ5ANKr1gazCZSrn1y8uT5tx94U53cu8Psg1UIXD8
         ZD5h4vhVpiUqDwKOPUHj00xv0vVtV2ii9FpuocsD4XwZfRRm761f6Po4WT4cDt8P317t
         V4YTZ7fuuTz/O46mSpeLr4BVDhokLefZ1wvPAzmtfyESxozF+dW5w+zIVngGsnPK7g50
         8k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705540; x=1774310340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHpf0qlU3IbYn7PC2sJHn8f+KjEEdcZ9cbZSK+YEuC8=;
        b=hlxWS7IwLJpuxHwiS427mOW66N6Va1dtAPRbPcZJnfr+Q1C6+mm0XZwGAqJi5TU6KM
         XGI/E7QetMhqRmJWaPLKHNHMs2pEz0O78ypT6VRIqmt1TWu2EDU887VrMqCkfex3at/M
         iDVlUpzj0e7LVTyGHsGA73e1rKIfLgrd+yAXBNcQbq4iVrnClc6vupU3tQEG6WaYJHoF
         lQ8S/w+CoyoISdjkCcV/3aKH2NpMUeJhTcTEH+NpbpP6pBJm9C+VNc00+1IUvC5p72Zi
         75KL91QbitK9SiQ0z/By+MobIZZPbCU/epnWYgl4kKXcXpmTsPew9HClEHQ6vO5KDi7y
         aUzA==
X-Gm-Message-State: AOJu0YwEF+GVaXPANShuvkpxYKJqRf/jzPsv8M7s7L+ZtsvGOpz+KxRx
	sJHOjycuZqaUQpFWP44oqT5fyBNEU1EPGeAwMv/+7O2s+0d+XBkHwYODXUGEfwpKAl2vtSy32qG
	E2/ukqWqfJe0jMIk7imaOX+nw6QmZGyKO/zbHLhhy/MdWW8lrvARQh3ch4agh4TiznUKS
X-Gm-Gg: ATEYQzxd36GJkQhofj4wx63ot+PKcAI/qz2UZz090gOW+fM40at/oFGm6cboRYCCd1N
	9qpo+4FImBqDK4deTR9KXduiNNbZPtcPvXRqzHPYJNr+uh1eGgIeVpJjMyrTyaVVV76H/xUply7
	/m9iI6WROJtunjgO24qekZRJvvikp6lFVWkl7p3ydUh1AuZR1e8eHHbebDpsT4HqOYcRxYHm7Uu
	hn87ixPkjq9N+TL3JbjVJ637cAEgAE/UbE677jhX89CTpP23wvr6Uht57SNLUnKp9AcVBCFRJ42
	7j9/4sA0p9/x6OpKj7mhD6Dax8WDKlBrf7ki5WQrqmGpouc5MEw+l9azjs3zVTN9zV9uzZRMcld
	r65PO0I4xJIwzJd8HY0DjaruAMVMyjXKpwzdkRhtqP4Nz0GSehVXsm+uDB8u89FywNMLSq+26yc
	Z7Lw==
X-Received: by 2002:a05:693c:2c93:b0:2be:8216:57e5 with SMTP id 5a478bee46e88-2bea53ec7c3mr5584728eec.9.1773705540292;
        Mon, 16 Mar 2026 16:59:00 -0700 (PDT)
X-Received: by 2002:a05:693c:2c93:b0:2be:8216:57e5 with SMTP id 5a478bee46e88-2bea53ec7c3mr5584707eec.9.1773705539673;
        Mon, 16 Mar 2026 16:58:59 -0700 (PDT)
Received: from [10.71.185.57] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3cd473sm16316228eec.8.2026.03.16.16.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 16:58:58 -0700 (PDT)
Message-ID: <a7866b7b-9cc3-49bb-80f2-37fdbce039d5@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:58:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
 <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _yKDTRVyU9BbbWRscvSImlY8pDkcZc8g
X-Proofpoint-GUID: _yKDTRVyU9BbbWRscvSImlY8pDkcZc8g
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b8994b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=xiaT7CXxcbYZedJJ_CoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE5OCBTYWx0ZWRfX2OjO6oj3reou
 bU1jeA5myvDbqswrfsSAiN1UwZGIvIIrFuNwOVghAOc3zLpN6foeW5CUzOXnNiRbj45GQe08OP1
 vWHr6tAwmJd1LTymD3WZtYPvFH5WO5GzmwZE0/3fMApJxtCUE57bOL9VueHhZBAzPw/fZxgbznd
 RL8qnr7DTXRdwZelSzxLF3R902v/737IUnuQYoxnED5kR95FaK307GDBXI8pRygf6CeQ9RdoJBM
 151qbvM1RUf8woN76MzyQHitbL7h9XRjwIWbbmlTuxbTTHh73mQoa/VqNnvoY6H2PqoYP7IniOx
 yD0JvrJqbCkvoXMiZxFwWDUHADIB9mS1QzKlhNq/oPIO6kqnOdS6bB8cHUves4wfisnQ0+AJ7Xt
 y72t7yYU/nmjeCFei8S16RlTH9L9u80xGVPh+xbZl37tlj6asJnUsJKlbPM/25GX6lnq5rgSk81
 Taeo6OtjQfeDwAWNhLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98042-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email,c251000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DF512A2229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/11/2026 6:41 AM, Konrad Dybcio wrote:
> On 3/5/26 5:28 AM, Deepti Jaggi wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Introduce base device tree support for sa8255p Qualcomm's automotive
>> infotainment SoC. The base dt file describes core SoC components- CPUs,
>> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
>> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
>> nodes and enable booting to shell with ramdisk.
>>
>> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
>> platform resources such as clocks, interconnects, and TLMM. Device drivers
>> request these resources through the SCMI power,reset and performance
>> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
>> doorbells to support parallel resource requests and aggregation in the
>> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
>> using the Qualcomm SMC/HVC transport driver for communication.
>>
>> Group resource operations to improve abstraction and reduce the number of
>> SCMI requests. Follow the SCMI-based resource management approach
>> demonstrated by Qualcomm at LinaroConnect 2024.[1]
>>
>> Limit initial support to basic platform resources, serial console, ufs
>> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
>>
>> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
>>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> ---
> [...]

Thanks for reviewing the series .

>> +		tsens2: thermal-sensor@c251000 {
>> +			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
>> +			reg = <0x0 0x0c251000 0x0 0x1ff>,
>> +			      <0x0 0x0c224000 0x0 0x8>;
> All TSENS regions are 0x1000-long
>
> [...]

Ack

>
>> +		tlmm: pinctrl@f000000 {
>> +			compatible = "qcom,sa8255p-tlmm", "qcom,sa8775p-tlmm";
>> +			reg = <0x0 0x0f000000 0x0 0x1000000>;
>> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 149>;
>> +			wakeup-parent = <&pdc>;
>> +		};
> Praveen suggested GPIOs are not controlled by Linux:
>
> https://lore.kernel.org/linux-arm-msm/12063990-70fe-4faf-89fa-c74c7bd97f42@oss.qualcomm.com/
>
> Could you comment on this?
>
> [...]

For buses,FW is handling, but for PCIe and ethernet , pin configuration is controlled by Linux. 

>
>> +		aoss-0-thermal {
>> +			thermal-sensors = <&tsens0 0>;
> Is Linux going to act on any of these thermal trips?
>
> Konrad

Thanks,
Deepti


