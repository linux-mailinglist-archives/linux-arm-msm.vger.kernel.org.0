Return-Path: <linux-arm-msm+bounces-117120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /gZZBQGNTGpzmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 789687176E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:22:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hRKT/rEP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H8TNwlKz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82D69301725D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19067384248;
	Tue,  7 Jul 2026 05:22:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FC383C92
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:22:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401725; cv=none; b=Y0P/dCGOEV330Ygh5KfHEducjg5ze/1/otJS4PABYScdyUWy33OBPKFmFeQvyyNc7/EkpV++WNs5DaEsFwFVu+Qr9ncTEWBOJ76JpSfXJUbaZOsuKw74HUAflkchw1iQBsij6+YucDmn4i8WnUky7dv+KhgMz5SGI8N0Mr9yigA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401725; c=relaxed/simple;
	bh=igCjqyVueqcQVBzSD05IH+bj6BH6zn4cjWjr648E5zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WY3CYAtUWf99VlSLnC0pSd6j3chdidqpxpXYAyNlXEYOVJgFe3/TC2hjZF8sWGRP+aO4ctESjTZhdNiKnQTxmdBI41KAmHXC60DVT42A+8CI9Gn/EkqHgBcXtCNINRIGGtIUPtul2kohtxWx6VuMoqcHbeK/JzAr7wWVC1FZeTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRKT/rEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8TNwlKz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674A7Ae2647598
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHMOr/irSJL3Cd18may6yQFNWy3Xdxd56KJP7bnvH+U=; b=hRKT/rEP9u86dT/i
	ijdu0P4uFQxuA/Qo9poXS81ZM6MLlseB1png9F1GVTArtrsBJp8su80VAAuyD9te
	cDRgKnQWk+nkwQ241tG85PaZwgvByTG5t2Dm41581cg30McPAtiT9RvtsVCpsASl
	dfsP6u2QdSHRcz144FXLuqpzNF5xWW3lwXWeq+j9Ira+XvrjZyAU89XLkzHx7nrW
	QFgtL2/XTnLxgIRmA7ThcTNVnNZuwiGrd/vsm06dmBR1mQoy/nfmOBxLJ9SZR5ne
	lPmVNdwYvcZ3rxIsd6IF1x/cN7dNrP9kj6HRuda1KjeqeSXVejmXjDCpqYjD/MI7
	geYNpQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cq78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:22:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810fcd9adbso389131a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783401722; x=1784006522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHMOr/irSJL3Cd18may6yQFNWy3Xdxd56KJP7bnvH+U=;
        b=H8TNwlKzQ/ox5wu79I9XbldEa1TvJGyLg67Jo1NBqb2/ILN7GTgAdoyg0XILi/sxJk
         G7w/TyemK/X77b8UN2SxR4OXkHZUUjAnt/y9PEPTp9VyALe6RYcLPiIuqfjdvrE5mboV
         SZPxlieZtoBC6iX8c1X2anFsYVLgRMV3RynBwO6PBPgZwSGq0mi5c7CEdVCrsiuUoJbs
         oRc68jaaUrLW5XG3iCTK8JWAeGryalPKracGvvuxYmvFhNZQR/15H2yCdJImsidFMXp1
         7+T7FKNrR7a696GI0fCEuk2gaxP4FCzNYnW0q/77f+W33V6+r7ULr9spTzh1qdxBk3ml
         yNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401722; x=1784006522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHMOr/irSJL3Cd18may6yQFNWy3Xdxd56KJP7bnvH+U=;
        b=kO+LTSMDC9SxFRMyoQRZ8JQuO4+biysVumNRj4JcgKxPsBJAvcnKVJH2eib7dVu+E5
         qCF1qcSZcggZVLA30MRyndua/QouVyTCGmyKj2yEVjWjbEl1tjgIm5nEvNLhs4jQfA/O
         eLIr8Z4U+kem8g0vnEBZO7Ya9Iy/cO1HgkQCMv6ysHewFyc8adtBIWMAbEXkM4Enp4gA
         OwypdCaC1NTehVjlFQ5D8nWKAUD2WVq89B5MLO/QNyt32kdZ4OW0pjqABeY6dPmEw91B
         R0Ko4f9XGYSQOmb54U2N1DpWUck6iHlctsYpNBgFSGvsGfxNflYHMuwCRRUmBhP/UR7v
         82PA==
X-Gm-Message-State: AOJu0YzVb7aNxYyOPaH88swc3haJfJswIduxsxAKbV2Zsq2lZQk2kX/6
	/qStU4bLS+wukoMxMBYj9e3IvDeG/8QXYuVaDfMpXuIS4IUHKG9RFjbOu+BgIgBgepKC8124G15
	Gg4Nkgh79VSyVgDYKABfV/884eoX10/fbflAFjcuzZ0FG61PYOOnItACsMwfHbn0g6BAl
X-Gm-Gg: AfdE7cmtfK/WeSPBbSqRitCHQxzGI26ZiGD6fBByqRjkfIlpeoWm5qP+e1k7Qy8uXTE
	ho7wi6RsP953Fm5QCCfrB312kweQtQDyadK+TODt3DYpeTTsY95aQqZi7ndullLguqJkVJY5ZPA
	t4SzVZgGH2uARa5ER23JJKsjNoTTbZgRRMYCiHUyy27Qcty58vrF3rGLUAGq+5pYB2uDWwutjo/
	XhnxR+1D4XFShKYVQDxRM5J/vDg1617gk795wj21YQjQIOkiZpNKIZeaTh09EmPzQIUQfWa85BH
	A/yps1JQRTR83AG3MJ2GJbrD4inWfxwEwJqTcNbNSbZqW9uQkCTtYk69KtUTcAQJlA5uC83PDOZ
	mACsTO29O6xCL++HZn9VXTuSUHC2b4ldC/hOGPNmBHGj5KxHDSvFh9E2OeqBL69h0u445EbE/2b
	S1GDQi
X-Received: by 2002:a17:90b:5291:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-38755a562ffmr4010423a91.11.1783401721687;
        Mon, 06 Jul 2026 22:22:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5291:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-38755a562ffmr4010383a91.11.1783401721206;
        Mon, 06 Jul 2026 22:22:01 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387ceb724b0sm427245a91.0.2026.07.06.22.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:22:00 -0700 (PDT)
Message-ID: <c48910ae-76e1-47b8-8e08-6383b3bb6e0d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:51:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: shikra-(cqm/cqs/iqs)-evk: Enable
 PCIe PHY node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-9-e1a721eb8943@oss.qualcomm.com>
 <6e42bc67-9a2f-4e64-bb49-30fd845263a2@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <6e42bc67-9a2f-4e64-bb49-30fd845263a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4P2E-ZvI4QdeLPBo755c10pKfEqPQxDm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX533HwhAlAyOK
 uRB1tSwr4E888RHLFvu5Awz0K/eYLhCE3zKxSKIrLyil7jREjO5xmVo5GnAzApWLRqdBkoqu3tr
 BpKtftim19kXY9/MAWxOtLm0vbs1QoU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX5rUj6i+UOMxe
 j8nOrN95zWJxIVaRgjr0+zR3mAmk78W6VLfkPsu3i+vTMqzvPbMcYPm+voYoLR4pKORXBY6csyj
 YNxrBDzrPQYRBaW+LwGlUzjRnMdVi9XD0ob0g9JUbzd6v41KUU0FR9+1v4ARDIXge5ZzvBPnsts
 z8WO5NFnEvoYRWzQMZSUeUeEwkptMlpkuM0wn1V+9CWCUHIFXqISz+8cWr/Oj64ifoF+sHLcn90
 MXz3eb1yp8xNE9vnDdIfU5BrQH3BCbYXOBfdCXoaE7+66MMqrsrORhYNl3l7clHkV8ctnZ1uClV
 VP6Qm8/2alThZ1EF6mE7PKIIe9t3rl0SK1OrxrZFaNiHLZj4rjpkTzCuVHYQkr1zDW14TAj1j7R
 NYzTO4NHTNtYfBKrlExISKHxXMWjnQrrvR6faq+V7SkQR0ZcHJVA7FNTwBdswZ1y3M5CuOZxtjr
 XsOML+4fHgV5ynQFadA==
X-Proofpoint-GUID: 4P2E-ZvI4QdeLPBo755c10pKfEqPQxDm
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c8cfa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aEzKkH0P_WG9QAzetnEA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117120-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 789687176E5


On 7/1/2026 4:06 PM, Konrad Dybcio wrote:
> On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
>> Enable the PCIe PHY for the single PCIe intance on the Shikra
>> CQS, CQM and the IQS platforms.
>>
>> IQS platform uses a different powergrid than CQS/CQM which explain
>> the different PHY supplies for IQS variant.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 7 +++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 7 +++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 7 +++++++
>>   3 files changed, 21 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 683b5245923b..06ad32041546 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -60,6 +60,13 @@ vreg_pmu_ch1: ldo4 {
>>   	};
>>   };
>>   
>> +&pcie_phy {
>> +	vdda-phy-supply = <&pm4125_l13>;
>> +	vdda-pll-supply = <&pm4125_l9>;
>> +
>> +	status = "okay";
>> +};
> I think it makes sense to push the status=okay to the evk file
> (because we already describe the PCIe switch there) and only keep
> the supplies here (because they differ)
>
> Konrad

ACK'd.

Sushrut


