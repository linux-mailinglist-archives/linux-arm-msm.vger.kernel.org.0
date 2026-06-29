Return-Path: <linux-arm-msm+bounces-114972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YLIaFalGQmpO3gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA106D8D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="K/MwGPFq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jtM9tevQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BF1B300E15B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A2D3F65F9;
	Mon, 29 Jun 2026 10:19:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048B83E5A14
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:19:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728357; cv=none; b=hrPCIxXXGJHXI/lIekJ8DgMVFiAFxqzCekdNFZ3TQ613dNC4FyhzCOvMXhZ8wXYsymBG9Twn+evGeTIv+RTLQ3koKrL7frHU3bcElraEbp97H7/kzI+VlX39YRtDwA3A4yzhdnJmGbOIlHMIgu1qeh5QH0B/iC7O5QREjbG36Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728357; c=relaxed/simple;
	bh=WKC79AJGEDwb3It0QfE7Gjokli0aIVhTp3q5Itfdu2w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TGt3eHbRqKf1jDd11ohGCmwSWPIzSAeVHNSQRBmKKti7r0bhcnhobt9xXgeRcqk/obzi4BCvGsBMQMAG3/vHwMmEfVy2gJJ2t7XeNX1oW56g4ahUnqhMfM3pBFaxDaKd7CzJLQQiBk9GpPsmRuXGTMz2liG/W56ZWYtUQ05OgSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/MwGPFq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtM9tevQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72bdx2163932
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPS3DNCL3/Yn4BNjN2CWMU+Gv8TsbwlcQhpLX/U9HR8=; b=K/MwGPFqI08YNPbp
	f4Zrag58UQ1FvWjwkooH3+SDpLux6d25XGzvtCBP6TRoMZtT0Vkm2lfTv1T+UMDw
	iAh45umz0ZQ+eTsiVRUSflczfdZPCTYoYdyVXbnL+LU9pEY7QYVvS1hvl/1iwzYR
	WgK1y9MEkcs2kP1JIt2xRmuhxGA3+WtRjnCZNzc6VnYEF+CpIRVXmd87FHl8RsX9
	nNzLZl+HUsNaZY+lPDtyB8/RhuA/ydqmByKgmn5KRgRyNoYQZoqKWvwLbzpOz43r
	+244KQJisNfu+QaP9FoEQYn/8WR6xW9twAy2Xg0WW/QH+7MMy0qUI2tUiNwfRuFT
	SOyCZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgt8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:19:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d3261c5cso650159785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728353; x=1783333153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hPS3DNCL3/Yn4BNjN2CWMU+Gv8TsbwlcQhpLX/U9HR8=;
        b=jtM9tevQrUnPM6o+Bl6uXoCwhxrk82yZDwJ4KXorT4fWbLZ1cSrpYO/fb0xKAcQ1G2
         UKpRoAG1kBTqAY1WKgT1AtN5f6CztiYVwNfIN+jCaowa6uihEY5BQjzSNCdL04uFnXVg
         k0+CD3AOlKSX4IKHS/RQYT9H0io6CKOKFO0eSOhxjjW9AHVwWczOXPZOHu2XaVGbi+F3
         z5nxgz1cHf7VB8cjugewcSd6PKCP2VU/7TE2O0yUzBWPrSwKuyCU3+hkCk+fVkzfIwGl
         97EG20AvgO60NaMjWRgKTJgptUGjMix0zxtps+BS0asA54LiJ54l9DSTSR07PQXWAedR
         D/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728353; x=1783333153;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPS3DNCL3/Yn4BNjN2CWMU+Gv8TsbwlcQhpLX/U9HR8=;
        b=jm8mp3sVZ9haGu0+sgcc21AnQina58489yg1nMaSiws2Q+wSlIoiy+2B4Urz4wegbk
         dZ3TMYKO9cCEL6L7JEiiDegn6/7PhSL4s302xuU4qmjLYUP5NDcGucCUdWs90zQxtFK5
         A7VZ3bBCyU8TYZfv+ENGA+4uvmNU6ftdmN14kVShJ2cm6jsX3BoBpSV2pg3+Ewg8cp4d
         U1HgiFpx166xbAPwYXPMKfHMFSyUOE83Gs7K0WQAyWc9ZdJTtnGEc4h/QBpVee1w67WP
         m9pgDOMIKM++voT3v7rQ3PZhG3r/3n5G69Utc2fw+fyVmv+Vm7GF5DTAaQ/qOlVw02gA
         qFHg==
X-Forwarded-Encrypted: i=1; AFNElJ9CTH0xLsgX2iA/6TWc9BvxvMfqNt8g0oH2aIa8DLEhVq2iTqFo74RMnT9oWyhxScSsbHgzkJuZqIt7PH3d@vger.kernel.org
X-Gm-Message-State: AOJu0YybFYLz23ME3to1TBifpcXsfdZPI6fjDxVUeiI8nnXA9SDsebHB
	TB9OWVedpkZEQOK+XrfqCXozbIlU7lgjwa2levtZTJP4WP1nAod09Pc07ORaLwQr+fRxS07EW6B
	USt+bJxlDN2we2qsXFgWrIUfPalV69C8tTjs0qWzF1zlpMithysFL+CVx7L7j1hQdsET6
X-Gm-Gg: AfdE7cn10SIzmgKqfk5A+n+dknGHlF0O1fsVBDSYUSZJ3t+DgWeRTxc+3V6JepmVE4l
	b4FYxKddp5qnyFLnzrlX1kRruyKc7NV367Fk/q5hJVoyCOWuhcw4pPfPOOvjGDwy3ApRbN9GqOR
	zXUHKe4VbEWkSvqj0rbAhQWEqiouTkfvW5x9FiSpTAF+y8GOndflF21Lj/YZoAGtL6PQjlTiGs0
	BYzZP6EgITCS3fDbBeDJh8GrVXIU0AeMkb/aay0N546lRx7PNaiKFURm7rMcNtFYPdQKKYNZ2Mb
	MBkx9lhU8E1X7n7HLKfB8NugkHPeFreA2NqSVmrXORepsS9K//lihZnKTfZ1XpZkb3zMwwenwb9
	guDi/OFLF0/icvPc+NngtsYOZ3QXlRw==
X-Received: by 2002:a05:620a:270d:b0:92e:5cb6:81be with SMTP id af79cd13be357-92e5cb683f4mr92676085a.3.1782728353201;
        Mon, 29 Jun 2026 03:19:13 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:92e:5cb6:81be with SMTP id af79cd13be357-92e5cb683f4mr92672085a.3.1782728352640;
        Mon, 29 Jun 2026 03:19:12 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12749e4e2fsm69732966b.50.2026.06.29.03.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:19:11 -0700 (PDT)
Message-ID: <916a4a45-9e54-43f2-95c9-0344455daba4@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:19:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC 12/12] arm64: dts: qcom: x1e78100-thinkpad-t14s: Move keyb
 and touchpad to ACPI enumeration
To: Bjorn Andersson <andersson@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <20260623145225.143218-13-johannes.goede@oss.qualcomm.com>
 <akHMf0MiXrYydnAg@baldur>
Content-Language: en-US, nl
In-Reply-To: <akHMf0MiXrYydnAg@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _SkQP5EEzdr4EXKwZvb3o2CEUbBX5XR0
X-Proofpoint-ORIG-GUID: _SkQP5EEzdr4EXKwZvb3o2CEUbBX5XR0
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4246a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wMK-mFH0N7_quViQIGsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX3TUXKJueS9J5
 rEfLzx/q8V77BhDrhv+3qo6eYg+iwP4Wq4/gCZQVlC3i0o12l4iVFQvpNs6RBbtUNbX+5ulq/Iq
 yEMJ6CB6MrQ+ufn1lCl1+jjYokFBCXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXwQPDTF6/ipjV
 KbKX/E6f1wbiCO4uPcbrpy5fgvG5tGYnNeb7AR33/BVQ2tnc/qeANv5CPwEiBXuOfN/nhQYBF2G
 l7bIWGj8e3VKPIDBkHVHmx6wR+5Bc4KhlfzaZyxA6gkqSZb1nH4kyUm2CYIEYYQZYqw/hy6iNCo
 +1mGVBa9ccdSOIdb9p6kEc0ck+2z5s0LZN91KvAq35PW/gXzdtHmC19iwLKDf8E+zIQu7/41KKX
 LicMhktB3dLULHKk9C1Mv5F8fkf3y3n+0NzClLo0UjlvnJRM0J5qOarjr8B2avOKiG9U1oBzALE
 qW6U/3wE+sT9ceGWS7Gjr5xodX053QpgG5nQYpiul9Y1ih8ZAuCEOCyFe91UmHQjsKKHtYOgCm1
 f/T0F/9CWQNycXp6duCb+sdbHYTh4255dp68jH6n3ED7dCl4Uq7i+SLF0PyzllrakKdos9t2NSh
 7OgLjyhYs9IprGSn6kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEA106D8D09

Hi,

On 29-Jun-26 3:43 AM, Bjorn Andersson wrote:
> On Tue, Jun 23, 2026 at 04:52:25PM +0200, Hans de Goede wrote:
>> Add acpi-path properties for DT-ACPI hybrid mode and remove the keyboard
>> and touchpad description switching to relying on ACPI to enumerate these.
>>
>> Also drop the clock-frequency this is also provided by ACPI now.
>>
>> FIXME: Needs DT-bindings patch as pre-req
>>
>> Note this depends on these 2 patch-series for working PDC support on Hamoa:
>> https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
>> https://lore.kernel.org/linux-arm-msm/20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com/
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 59 +------------------
>>  1 file changed, 3 insertions(+), 56 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 2fc01e8e8c04..a73576ec238d 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -1017,57 +1017,8 @@ &gpu_zap_shader {
>>  };
>>  
>>  &i2c0 {
>> -	clock-frequency = <400000>;
>> -
>> -	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
>> -	pinctrl-names = "default";
>> -
>> +	acpi-path = "\\_SB.I2C1";
> 
> The +/- are not equivalent, you're removing both pinctrl state and
> device power management - relying on the default state (or other
> client's votes).

Yes for pinctrl I'm relying on the UEFI/firmware to have already
set that up.

As for device power management the regulator references being
removed refer 3 regulators which are all marked as always-on, so
there is no change there.

FWIW I've been dogfooding this on my T14s (where I'm actually typing
this now) for quite a while now and it works fine.

Regards,

Hans




> 
> In addition \\_SB.I2C1 is not a stable ABI.
> 
> Regards,
> Bjorn
> 
>>  	status = "okay";
>> -
>> -	/* ELAN06E2 or ELAN06E3 */
>> -	touchpad@15 {
>> -		compatible = "hid-over-i2c";
>> -		reg = <0x15>;
>> -
>> -		hid-descr-addr = <0x1>;
>> -		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>> -
>> -		vdd-supply = <&vreg_misc_3p3>;
>> -		vddl-supply = <&vreg_l12b_1p2>;
>> -
>> -		wakeup-source;
>> -	};
>> -
>> -	/* SYNA8022 or SYNA8024 */
>> -	touchpad@2c {
>> -		compatible = "hid-over-i2c";
>> -		reg = <0x2c>;
>> -
>> -		hid-descr-addr = <0x20>;
>> -		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>> -
>> -		vdd-supply = <&vreg_misc_3p3>;
>> -		vddl-supply = <&vreg_l12b_1p2>;
>> -
>> -		wakeup-source;
>> -	};
>> -
>> -	/* ELAN06F1 or SYNA06F2 */
>> -	keyboard@3a {
>> -		compatible = "hid-over-i2c";
>> -		reg = <0x3a>;
>> -
>> -		hid-descr-addr = <0x1>;
>> -		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>> -
>> -		vdd-supply = <&vreg_misc_3p3>;
>> -		vddl-supply = <&vreg_l15b_1p8>;
>> -
>> -		pinctrl-0 = <&kybd_default>;
>> -		pinctrl-names = "default";
>> -
>> -		wakeup-source;
>> -	};
>>  };
>>  
>>  &i2c3 {
>> @@ -1598,6 +1549,8 @@ wcd_tx: codec@0,3 {
>>  };
>>  
>>  &tlmm {
>> +	acpi-path = "\\_SB.GIO0";
>> +
>>  	gpio-reserved-ranges = <34 2>, /* Unused */
>>  			       <44 4>, /* SPI (TPM) */
>>  			       <72 2>, /* Secure EC I2C connection (?) */
>> @@ -1655,12 +1608,6 @@ hdmi_hpd_default: hdmi-hpd-default-state {
>>  		bias-disable;
>>  	};
>>  
>> -	tpad_default: tpad-default-state {
>> -		pins = "gpio3";
>> -		function = "gpio";
>> -		bias-pull-up;
>> -	};
>> -
>>  	nvme_reg_en: nvme-reg-en-state {
>>  		pins = "gpio18";
>>  		function = "gpio";
>> -- 
>> 2.54.0
>>


