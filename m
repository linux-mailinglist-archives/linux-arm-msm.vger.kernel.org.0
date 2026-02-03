Return-Path: <linux-arm-msm+bounces-91648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG3HC5nFgWkcJwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:53:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877BD7236
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C21C53091ED9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20A439A7E3;
	Tue,  3 Feb 2026 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYH4ogsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUb3Dhy2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB3399034
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112236; cv=none; b=Pj+mGfbJYOCEl8YlgBpmb4GaAX0Ist5xloCMUmUL2ravf04aFf18LwMlVQujb6Am5Ht7ARZlvKiIqiURfl/GlQKKiuy4OPKroRO0Z01EwwO8QGZMLEbQ+DiispO6Z3QdW/mM7TTGsMw2lHAJxIuL37Ez0DbsrfKdwGgyVhL7Ebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112236; c=relaxed/simple;
	bh=oc8pMyysOJDjCUMKQVsu/DaqzTROiNC2lDSiioXTjTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+/7Oau3osfZBdAwDC54UdqyBmmOPu7xDh0C5dHW3Kq4SsJna+IL3YYSj40mQHPj+H3/obvjz4Tc6EWQyziHzpjzt0NG6ObgCsr5veBTzNr8rz9SjCzpEBlRGWjBelYzyZdqeRjbbK+Vr1H6CMvQrf1/YGUWlp4wc2YfxnvhdrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYH4ogsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUb3Dhy2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61374I8k2356975
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep4+uDfcxCJLh/bXjeO9JeCeBa8M5Cia2OdJ1IrmJMo=; b=dYH4ogsiSdWiw4TC
	phbz9KUci2QeEirL3zLdy4IFnd0kcFYKvAZc+Sn+OlHj2d7xQGJSqUch9NBBayBP
	dvBaFDWDjhgwsqnZYk2b4lxvG2ExICJZog3q8b+onQFFbvP60huY+XcusZ76t0gQ
	ukw6EMWRSh2ULH/prK2A50vyhx2BK/DtKrFNq4PfEkQwT4b2ucCuDsgxMSefbd3s
	kn8Yqb5DjwQKVOLMC80RWhThOB9nfBM3z1/MXvJRtHCxKzYhFMer9OBFnURklumi
	c/1wGS89sbsW93c6kVE5jYp+Po87gfPrTguG9tOu2HMsSjnOk//2DJrMhR3N3moa
	SMCpzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mbj31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:50:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7177d4ab4so129083985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112231; x=1770717031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ep4+uDfcxCJLh/bXjeO9JeCeBa8M5Cia2OdJ1IrmJMo=;
        b=dUb3Dhy2kK19JY53PFM6zO/vPby0lXoD+H58OK00lXVcWXKiKTQQJYhVPGtmKQ4EnE
         oXpA7NVDuKqmBNYJMclJ+24MoMLnKwTGy/1kEDM/YxqEm4B0T/54wc4VIeWqi2hh/8Dp
         bVJYpxZTZyw4gLektVIKX7ZvO33FjZKTMMAik3W82pA6eYSszCkZJUHc8WSM4BuxGUL0
         wmq/Ynyw+IDuHOynR6SwtGzXnLzCu8jMiwULas2sbWy/OuH1eqn4a59iY8G2U5xD3no0
         OHnlShoNYL2rjmiOSJyauw26hrTU0sxaMbLFZ08NpOi0WRsoH31BBt6KH7uGKPi+0EyJ
         kOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112231; x=1770717031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ep4+uDfcxCJLh/bXjeO9JeCeBa8M5Cia2OdJ1IrmJMo=;
        b=JFP7ozHNlmQ4YfnNTw5qhkK+ZSgWkbIZppcBLhqt0ehUEiiHfNVn1AMjybfkAPVbsn
         YFWCUFLGJWkIMohfR9W8FWXTPgMdtIrblL6i0aj2KhlJRmNBCxlfFsC20jFwsk2ahNbC
         ZQE2CVOmiuOwJ4pN0edzHyalQgDsPivi6J8AyRGunGw0rfyQTAisJ5ZhTwKP0w9XM3gp
         guAJzgB6SZIjGeYAyMS9zmCmYpfgJJvGqSPoHbcxf4/tdmGDsjqMkA48NmnitqyRDnqo
         zxAHMHHmdt+qitPUpFQNgRyo4RSaNPy6M+sr1+2VkA5VQpcS5utLgIr0IErW/7T0tBS7
         HmNw==
X-Forwarded-Encrypted: i=1; AJvYcCWZnFnoMjpPXmfaeXt43P5QcQR+YFjA4rcU8mnn+ENZI6x+JjGszpj7/DYqkXfZbAfFg1FFKkdi0zL9Iy5G@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4jR5sSiuJckYpqDZ5Ip4/05vohHVNySrGdesd/UAsoZajwLH
	Zno1MAUI4QNFwlKhrciAkqTwNdd7gcJApwCSrZBKj0HW8zdtBFhHiWG9E7PsRrVLRbp63QcGyFd
	uEYaj5iFjFZMcqhVN8DM0SCDug+CRJa2yefisyznqhUTxafQdHGEIGfTkogSK5/LvuhlrOKa07B
	gP
X-Gm-Gg: AZuq6aJFZPFgMD7Irw7rFed1NM4EUrSG5TTs7KOOwuz4TduZF+3bkdOd/tYKQ6/L127
	+tje6YXf5tSkie58IGqdywTGFVYaParVe/AHkSfVJuXV5cg9dUvzYTD7iQvSgcrPzcurDRCk63p
	wAxXJ958oSk35hkf99lEQF4BEzAZULUIxs8L0z3aGDAvYTbR0XN3+lO8Y/5hg4fqYOWKMr/aoU7
	KikVfMqHO1KXGhYYBz664FiYi/8Ow30YmDa3V8+8F4RUq6VTuQPuabOvk0/Q+qnXByldPlwvepH
	LcPP1pO1LZ9ZDQXvTfnNuxL0GThchAauvS6QrtfHUQlT7dY6q80jslQX+RMeovrGEoEGfGpIdr/
	4DfOOEPDR+JnPP4tPVA03/MCzq/VTGmR1aC6AsQzxC8NVouijUeOMTzUIZs4EC3nA7UU=
X-Received: by 2002:a05:620a:208e:b0:8ca:2e7:56c5 with SMTP id af79cd13be357-8ca02e757camr692510285a.11.1770112230622;
        Tue, 03 Feb 2026 01:50:30 -0800 (PST)
X-Received: by 2002:a05:620a:208e:b0:8ca:2e7:56c5 with SMTP id af79cd13be357-8ca02e757camr692509285a.11.1770112230120;
        Tue, 03 Feb 2026 01:50:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2e0619sm996418066b.59.2026.02.03.01.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:50:29 -0800 (PST)
Message-ID: <7a79bcc2-42d5-4a4a-ab7a-ab02b2605cfa@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:50:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
 <aXtM9vE9y73vnVeA@hu-qianyu-lv.qualcomm.com>
 <6d2b92d0-55bb-4ce0-ad5e-316210a3d2c5@oss.qualcomm.com>
 <aYA0RBA9FjNmP8Ui@hu-qianyu-lv.qualcomm.com>
 <fe6f4de9-eb9c-45e9-a9c1-d780cc2f721c@oss.qualcomm.com>
 <aYB6pS4EQVP4w0O9@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYB6pS4EQVP4w0O9@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981c4e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=gEfo2CItAAAA:8 a=3F63jh4F0cb2cUXUoCIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GmPDy5HL6jxHAKu6vIRu_ALvgGH8hgCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NyBTYWx0ZWRfX9BB3TpOQYRZi
 L73iIWWBZGXo0ZLQNMQH6K52nU7QiLLGgS6AgK4N8BsAjZ6Wj0075q2CTNputjtE/ubh31DYbed
 gGg6JZ9m1OrSsOrXnEg17IW1tK765CLLh/MVD4BZAQIJK224526vt9L5WCDpszqcfVKzoYPTfCx
 +7EdI9VrOzfnUYxwJuvZyI0FHwV2ZDuqI9KkT2/80lqTVEpUGZI6UTKzQVGoMT50ZArhdZ5SrR/
 bW+pWyakkX/Y1t+VbEwqD+N1EBdil57Oembi8JlzpYdF1wLIcdQqxy36K6HAK9c1APRKWHWY6Fn
 WUVBCOz7eLsJwzPz8Zoyp4ww3oFRMl0o6FsGV/zPAJcpy4qM/vLDFX1lqmrdI5rZLld+rOnWL2i
 N7hntjO/hos0q0IUUhy339wiXDdwat3eHDiU+iJh3pNrnAWsfvWSnDwCbndFOgbUPBD+mgvOmI5
 Xy8E7Tr3rcPmG63UfFA==
X-Proofpoint-ORIG-GUID: GmPDy5HL6jxHAKu6vIRu_ALvgGH8hgCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91648-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:url,qualcomm.com:dkim,0.12.53.0:email,0.0.0.0:email,codelinaro.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.1:email,c426000:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9877BD7236
X-Rspamd-Action: no action

On 2/2/26 11:21 AM, Qiang Yu wrote:
> On Mon, Feb 02, 2026 at 10:49:10AM +0100, Konrad Dybcio wrote:
>> On 2/2/26 6:21 AM, Qiang Yu wrote:
>>> On Thu, Jan 29, 2026 at 01:07:08PM +0100, Konrad Dybcio wrote:
>>>> On 1/29/26 1:05 PM, Qiang Yu wrote:
>>>>> On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
>>>>>> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
>>>>>>> Introduce dt-bindings and initial device tree support for Glymur,
>>>>>>> Qualcomm's next-generation compute SoC and it's associated
>>>>>>> Compute Reference Device (CRD) platform.
>>>>>>>
>>>>>>> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
>>>>>>> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
>>>>>>>
>>>>>>> The base support enables booting to shell with rootfs on NVMe,
>>>>>>> demonstrating functionality for PCIe and NVMe subsystems.
>>>>>>> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
>>>>>>> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
>>>>>>> thermal management. The platform is capable of booting kernel at EL2
>>>>>>> with kvm-unit tests performed on it for sanity.
>>>>>>>
>>>>>>> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
>>>>>>> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
>>>>>>>
>>>>>>> For CPU compatible naming, there is one discussion which is not specific
>>>>>>> to Glymur, Kaanapali and Glymur use the same Oryon cores.
>>>>>>> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
>>>>>>> We've kept the "qcom,oryon" compatible
>>>>>>>
>>>>>>> Features enabled in this patchset:
>>>>>>> 1. NVMe storage support
>>>>>>> 2. PCIe controller and PCIe PHY
>>>>>>> 3. RPMH Regulators
>>>>>>> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
>>>>>>> 5. Interrupt controller
>>>>>>> 6. TLMM (Top-Level Mode Multiplexer)
>>>>>>> 7. QUP Block
>>>>>>> 8. Reserved memory regions
>>>>>>> 9. PMIC support with regulators
>>>>>>> 10. CPU Power Domains
>>>>>>> 11. TSENS (Thermal Sensors)
>>>>>>> 12. DCVS: CPU DCVS with scmi perf protocol
>>>>>>>
>>>>>>> Dependencies:
>>>>>>>
>>>>>>> dt-bindings:
>>>>>>> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
>>>>>>> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
>>>>>>> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
>>>>>>> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
>>>>>>>
>>>>>>> Linux-next based tree with Glymur patches is available at:
>>>>>>> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
>>>>>>>
>>>>>>
>>>>>> FWIW, I applied these patches onto next-20260128 to see if things has
>>>>>> improved since Rob's report and I get:
>>>>>>
>>>>>> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
>>>>>>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
>>>>>> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
>>>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>>>>>> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
>>>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>>>>>> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
>>>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>>>>>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>>>>>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>>>>>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
>>>>>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>>>>>>         'qcom,pm8150l-lpg' was expected
>>>>>>         'qcom,pm8916-pwm' was expected
>>>>>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>>>>>> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>>>>>>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>>>>>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
>>>>>> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
>>>>>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>>>>>>         'qcom,pm8150l-lpg' was expected
>>>>>>         'qcom,pm8916-pwm' was expected
>>>>>>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
>>>>>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
>>>>>>
>>>>>> So, we're still missing a few dependencies.
>>>>>>
>>>>>>
>>>>>> Booting the system I get a ton of errors from PCIe in the kernel log:
>>>>>>
>>>>>> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
>>>>>>
>>>>>> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
>>>>>> 508
>>>>>>
>>>>>> The system does eventually boot, and I was happy to see that we do end
>>>>>> up finding the PCIe devices after all.
>>>>>>
>>>>> I enabled dynamic debug logs and observed that each PCIe platform device
>>>>> probe was deferred approximately 10 times. The probe deferrals resulted in
>>>>> additional OPP debugfs warnings being printed.
>>>>>
>>>>> The PCIe platform device probe was deferred because the PHY driver was not
>>>>> ready - either because the PHY driver was not yet loaded, or because the
>>>>> PHY driver's own probe was also deferred due to its dependency (e.g.,
>>>>> 1fd5000.clock-controller) not being ready. This is normal behavior,
>>>>> correct? I also observed that other driver probes were deferred.
>>>>>
>>>>> But I'm not sure why there are more than 300 times probe deferrals on
>>>>> your setup.
>>>>
>>>> I think Bjorn is trying to say that the driver is wrong, because it
>>>> effectively seems to call devm_pm_opp_of_add_table repeatedly
>>>>
>>> Okay, to avoid PCIe driver probe deferrals and the resulting increased OPP
>>> debugfs warnings caused by these deferrals, we plan to move the PHY
>>> properties back from the root port node to the controller device tree
>>> node.
>>
>> Would (roughly) this solve your problems without messing with the DT?
> 
> This change cannot fix the OPP warning. The warning occurs because the OPP
> subsystem creates debugfs nodes using "op-hz" as the name, which is not
> unique for PCIe OPP tables. Mani posted a patch to fix this issue:
> https://lore.kernel.org/all/20260130071940.6949-1-manivannan.sadhasivam@oss.qualcomm.com/
> 
> Our goal is to prevent probe deferrals from occurring in our driver.

Right, I would assume that was previously aided by devlink taking
into account 'phys', but since they're no longer part of the PCIe
device node directly, that logic fails.

Still, modifying the DT to fit Linux behavior generally indicated that
Linux is not super good at doing that particular thing.. In this
instance I think we should extend drivers/of/property.c to maybe check
for supplier dependencies under subnodes of nodes that have
device_type="pci"?

Konrad

