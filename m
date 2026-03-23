Return-Path: <linux-arm-msm+bounces-99162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOWKBosLwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:44:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35E2EF463
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 899C13012259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8C838645B;
	Mon, 23 Mar 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHgd3u9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvcjkVpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636929992B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258764; cv=none; b=Ken9uxD9PN184l7C3WcCWfLG0xVfGj32S98jUl+tFX1J6fYJ922A7JJtLMT90kTc0NvAv0ovMMqSwNm/i1NOlp5f/RDaDeuMdPcxssRQ7tKxEhiPwZ1DGt5BdqC+eatG41+Qu1U5jK7qNlvmaucyj5XKp8ZFQi6rNR4DY5Nb9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258764; c=relaxed/simple;
	bh=pQxvm7ndzvWsuOsFpJlNW1nlGs8MwK3wXuI2d4hFdJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZO2f7a+4eCbIWyBYVddXclfZ97pA45DoJfN9LoEp8O/RrPIIBoR7/w7lYZl0a6W2HHB4RATh+X/BlZTGssI5J/xjA5GM8VMVRcFvOR6EWeyv4zkvAr83OU6Io7EEeK04JVLFIlfoie0h+YGwKbcVc6f9lT7pWSgC1EbRucAZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHgd3u9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvcjkVpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7WaZw562075
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxAkSVz8M2FTfuo0qCgFYUBjaV8Dv/qmWNiMLDJQDBw=; b=iHgd3u9FbK4xwvrj
	a1aTOhWyTYw2JvhIe7GCJXL/rabxmZ89orNQcqAdPOeCrxrqeidBEk3lYqmLSiIZ
	7Fn8/1LUXd0NO1TN+S0unUJfUSQ3mJDuj7TO2R8Pew+JJp2hxrnjlC3vdz997jw4
	57qKCY+Y+81Qq6zAPVMcDoGodHjX7/sMfa97FVfxz0Up5FBriVs0Lu+CjZ0gAko0
	Gelba6oDnE1faolgIfzeO2CQhzfCVLflXCvDGZ4WWeOX40dcwPXO1TfkgwHVgh2j
	/nInvJQ6x4z7CYbfWBCDVv3ukrzxt33LvN4PnuXfR/kRmRJaxYyK05j3YQBibprA
	gjqTHQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmsg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:39:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso37430266d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258761; x=1774863561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxAkSVz8M2FTfuo0qCgFYUBjaV8Dv/qmWNiMLDJQDBw=;
        b=bvcjkVprNaeD4+op/lmVZLAJJrKeWbXUj8VPTaY9wlGnShpSYNXflFYqdCa/RNj0NU
         H1E9OaLhbyOfYHTZagN+1F8EBon9iayIUEREv6utgOKqrKbt4FR9kQ/vozv7AnXRB6b6
         Uq4+2A2CDkFhmyPMhszpyi28L6YjqipOvEX85TkZpnCkpFOmRWmUpPlY04+QG0/kmSBf
         lzUILK+1vxDxw67433kIKf7hyd78ZTTT4Sp1cWWx0P22CArugIZjku2oCtg3OjqYaeFm
         3TKzzUCPKxwuSdrMtenjlOwL31acVzg4DoGZgkm+svTIseu42fK2Lq8XTeFpAeGdBAwg
         SA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258761; x=1774863561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxAkSVz8M2FTfuo0qCgFYUBjaV8Dv/qmWNiMLDJQDBw=;
        b=mvbWfjGlgrYk5q+jxHk91UGQe7yfxJEUpTnMaHl2maMYax3FW2P9x8EA5B0HU7dJpx
         GxHeKprZKcJ+3Xr3WptOEnE97NFNMOZ8gkZLwrFRYND834DlKo7VJK5+632Rtpnid1Rj
         pPQuSZPrIy9KUp7ZrCwy6VOQ0u0t8ZWAjjEUWmjmYXK3mHcdaHI/nK+PzQdKRtg2Gfuw
         JUzB4wWyVhQX+Xe5o+4dAzq2DylcpNi05Ic5o6wYSNpD+iqZL/NAxLWsALbPWuZ4UDxr
         ubOLjAQK3/sGpS/8o+PeWDT0dSypdu3ajoEtOoqBvAQ2P/9B/NAn3gd0QOJ6HmeWXUWn
         hlWg==
X-Forwarded-Encrypted: i=1; AJvYcCU6JIER2iLasVzlV4II4YNU5stEF44u3YehHMU4yuDR085ludr66JImxYzLrU56e8mu1RZ27v/F7QAtnrFS@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpfwBrxgAi2jksvrGtFwfnPmtomFKDbFH3zdoKVpVWFf6y9ct
	eDtY9abt8CmCWbbNRj1REEge7FQyB5Z02p9KCqqlozBQVD3gqBLeQJ7oieE3azGJwPSQmwQQVtb
	qFL4yL5Y+cNs+vMSLaIr12jtVTYPkkhHKdSoQmZx5F6GZoEh20vcr4jj4FGAaj4kFqEvz
X-Gm-Gg: ATEYQzxerG7yinMT7yk17tB4EPN38AFpIFOGsKX1dIgM1tVqvKY5DUmSoG4yYN0MXg9
	Itb2HGbE1AiamiZ0iHu0orDgM2QIUJaM+HBh5waa1FMucoBjqi0KEEYYmWxGgnsWzJla2J0LQNY
	D/SHWo8jljUszBRFX9XXHKk3JUTJFyNKZQotzB6EutfLjBBq+sy1ywwLt+RvShsvZaflWgn79uf
	+iLBJ+K4vhaUikk0LQgWpleuvdlc/lSboBvUP5LQYX0eFMRj4RhLDzJPIqAJxSoMVRdZLRA0UZn
	jb8QoMdgxUWPj0b2KCPx/KWKEiQJ2wV1FpZGWHWxZg8E/ZV3aPazzSpLJEjGNWANjW8dVL5ZC46
	PBZJFx/dT0oFqjFzlTyjHnFyI5e7w4XmHHHV1npkwLjaWJcERgfH0XIDiAx5jMy0Ja0aKkA9ecb
	iCwu4=
X-Received: by 2002:a05:6214:2588:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89c858ec443mr152756616d6.0.1774258761382;
        Mon, 23 Mar 2026 02:39:21 -0700 (PDT)
X-Received: by 2002:a05:6214:2588:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89c858ec443mr152756386d6.0.1774258760871;
        Mon, 23 Mar 2026 02:39:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365d86asm476556666b.48.2026.03.23.02.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:39:20 -0700 (PDT)
Message-ID: <fd8c59b8-c35e-4add-a028-5f029a09fe4c@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:39:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>, Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ97zmk0BmctznXrrnyyk50XH506GrdWSU-mEeN3NVEBFQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ97zmk0BmctznXrrnyyk50XH506GrdWSU-mEeN3NVEBFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NCBTYWx0ZWRfX4zakNNM0zs31
 Jda5DLjxy2sycOgCW86qhIHCb+5L2lzpWMZY3qXyvyFUvVLFEujjXSPONeZmjQ38Rez73t4MRCH
 VeppS7MkdSZ05oBKLHpUeK3qM3aLF5C80b34cNYRE431IuNDkuTZr/cJpSGJcl3Li4G6UXZm0oh
 STicOZuAHAf7oQnj7xfngZSQRu+5zCo6fidd0sFRN19reK5Y9dcEHMP6dClq0nCm6ZG29QgDw7R
 HRbpIf8u0t4XPlnt2gbavanbrr2U252OQZdEwUeqPEMEJIaUE7e5afXhXqAQv2fEOTS7sLe5lpP
 cZa5uA/xvau/kztLl+echesWHVLSx+XMxVbA7Uq2O4H66h4w7vOPD7yFNPLkKdmGly6Rjn5W8KV
 Uv/kwWBmjhoQjCE0EvqtLuplThfcPQR+31RnYzYDC9LHOesfVNHORunOJiNaf9L1kRk06DVXN9J
 JBRR3cDp0BtDLLX05NQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c10a49 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=PRwFffclZ0ixmdfpURsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: U1PozgHLOx8oC_vLgIzX4x92BPgFRnZy
X-Proofpoint-GUID: U1PozgHLOx8oC_vLgIzX4x92BPgFRnZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-99162-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sobir.in:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,packett.cool:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B35E2EF463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 11:31 PM, Aaron Kling wrote:
> On Wed, Mar 11, 2026 at 7:49 PM Val Packett <val@packett.cool> wrote:
>>
>> On 3/11/26 2:44 PM, Aaron Kling wrote:
>>
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This adds a base dtb of everything common between the AYN QCS8550
>>> devices. It is intended to be extended by device specific overlays.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>>   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 ++++++++++++++++++++
>>>   2 files changed, 1778 insertions(+)
>>> […]
>>> +/ {
>>> +     model = "AYN QCS8550 Common";
>>> +     compatible = "ayntec,qcs8550-common", "qcom,qcs8550", "qcom,sm8550";
>>
>> Huh?.. All existing -common files are .dtsi includes without their own
>> model/compatible, and the compile-time "dtbo" support is only used for
>> EL2 where we want to apply the same thing to many many devices without
>> polluting the tree with extra glue files. I don't see why this should be
>> a "common device" with its own compatible string, and not just a dtsi.
>>
>>> […]
>>> +&gpu {
>>> +     status = "okay";
>>> +
>>> +     zap-shader {
>>> +             firmware-name = "qcom/sm8550/a740_zap.mbn";
>>> +     };
>>> +};
>>
>> Please use the &gpu_zap_shader label.
>>
>> And does the generic zap actually just work?
>>
>>> […]
>>> +&i2c0 {
>>> +     clock-frequency = <400000>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&i2c4 {
>>> +     clock-frequency = <400000>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&i2c12 {
>>> +     clock-frequency = <400000>;
>>> +     status = "okay";
>>> +};
>> If the individual devices actually use these busses, better to enable
>> them inside of their .dts as well I think?
>>> +&iris {
>>> +     status = "okay";
>>> +};
>> Works with generic firmware?
>>> […]
>>> +&pcie0 {
>>> +     wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
>>> +     perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
>> Current binding is to put these inside of the &pcieportN (renaming
>> 'perst' to 'reset' which I just noticed I failed to do for one of my own
>> files :D), see x1e78100-lenovo-thinkpad-t14s.dtsi for an example.
> 
> I tried making this change, but the pcie port failed to probe. I also
> notice that all existing sm8550 devices still use the 'old' syntax.

There's a ""feature"" in the parsing code that will only let this work if
both 'phys' and 'xxx-gpios' are under the same node (i.e. both under PCIe
OR both under the root port), I think this may be changed by a single big
change later on

Konrad

