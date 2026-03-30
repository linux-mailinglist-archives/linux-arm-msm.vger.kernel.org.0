Return-Path: <linux-arm-msm+bounces-100778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKOE7deymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:29:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9635A45B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9B52309D0C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC9C3BE14D;
	Mon, 30 Mar 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k22DrDpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0e3V0bY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6383BED07
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869835; cv=none; b=ZVIrw8XT8HukNZOut7GnKx0JfWuLREM09Vl1qVq3FquBYWi8ZxKB2JqAHW+zSrHEaiXQ7Z6jUAS60He8cB6pdfJK9s8Dqda32Xx1Fe8hsoOwsCn+DDGJap9Z2rdDX+pOmdHsjYh3H0CoNaSaOI2r7iLYc1qlxzFsh6ttmQhfAsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869835; c=relaxed/simple;
	bh=XNSFdpfM2bR32VIL/Pg72BqKpzv1k5qHNf3X+rW3gcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRd2dkLuqUsYtIyhx8Pb/VE1CjMvBw2H5bB/mJZXpll2fmKPrnp0LfCALZdvIATC1BlZ6IpbKxKt1QDRlEmk2ebtNeY+PjnJlslmkrKohzAL9tXz1ud2noTNz+Cp8xGR/PsrgalvzsXvbv76tKX795xRGf9/d8QfhfVpHPFBBRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k22DrDpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0e3V0bY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9nB2h3721921
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/B/dlQtYbpnYFICsQED7Vf8n3G5q0NzZv4+0ckMoCzc=; b=k22DrDpp6dykv5Um
	6eVOK9Ohrszxsb9mAphHmQ73KOyjP2+fQoqqQDW614ch/+9W/B2IrtE0EP98kFYw
	q+NL7yaay59gqCdS5CBz4UUNc2t+cQgHWyS1HJEsL4xHVk/D4jr1c+pYelKhN2ZO
	QTftm/qbf6DSRGwby+1HO+Nb1Jyzk5Yem3VBfZ37sFfPEzU0VTzDfqt/bUbVuG5p
	yDCaxJ9tPq+1MZBGa1glC5yiallFr5H0IuVOq+zsRbSxPNdHPCU07mRZ6QH0Ryo/
	u4hVXevpDaDAO3OWe4neb7VIi9A2i2BeqIeeejV5O3KoWPxvv2hTiKarttlQdq2Y
	zPeP8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmraqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:23:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so4650050a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869832; x=1775474632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/B/dlQtYbpnYFICsQED7Vf8n3G5q0NzZv4+0ckMoCzc=;
        b=j0e3V0bYUVn/Qji5ER54kJDydi1uTO+OCOEAvkp6BmjbaQ7oeIZsrF7Nu2dXP6Xl0e
         TDimJi3Fz+HICBV7drYlpaL7Dpru1KZWa01jioUPL/u70umTaf+SMoME/0Kmo4yHQnCi
         sHNdlHnygLPVTRgv+K+SiVLcpKka4wcwaRsEqGHT/rSiEqq6GK7Ar5uOHEweeGENczUZ
         sjCaYyMMiSAM6ppamZmQv+cqwaSbXOkhkKuKCm+aywH+/vwj/mE4+ijUzMBgUBHq0TH0
         a32irDW13XWSQEhRIy1tzX0slTddPsdvEus778c1Hhm4aTUcJl6Alj1+fZ30z6DwlIxU
         oqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869832; x=1775474632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B/dlQtYbpnYFICsQED7Vf8n3G5q0NzZv4+0ckMoCzc=;
        b=CLKS3HvpAy4vcqTBzI3qc2fsX8yC7jIh5zIVLtOx0SB8goNqR37K0DWRCBsv5Dsqeq
         GHtqxUBjjv1E+u48bui95dSCvLxaUqq1p706Ptnyd9k5ojvve0oUuH9GRSwGkLKuGzlf
         Yg5sWghDBXMvkHiRqc9O8KZSNXDSSvdqC5cs18r9IdV8OLpHiOLfyF2HhvdGkpS68+YM
         BePOvHFTtVM09ZuVEoPQJnolaPd/+mrf6jI5xtW/WR2jjniXbMWpVmEav8+BrcV5PjDQ
         8I11T9/YD6/uqeTU2eBShMfbxEOMez3GwYqR/DNSfUZXDkYW9PZuWmWG8qWclzOxq9Kn
         XdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWphTmMVJALnBmue9JpdfVxlhdNyaqmq1Exg3oaOqSnXrH4zJj3dH+QMTj/AVhMJ/7G1AuOSdjy4i7ruuAb@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDK2CUWkDa3kLewVaxaQAzayNg0jrSANzZp44lBNlAx1NJk47
	tCS1kDJOgjPZ8nQMsp7Pb/CDkalIWmN8eKzlbmdPuiEw8efBeohuCWfEvZ1Q4dOpi3xw+vqwEzg
	ENzs4V12Ma4OkwXci07oXSl8a8SheV/QAzEtpUrx64JJalpSRfSvBLalk7Ce3cE251CDk
X-Gm-Gg: ATEYQzw0prmDSQQwdbOd4oeRXnwdXbPATwB6ArDUPfGCKmBigSntnQ8tXNawtqS7g6N
	m8G2hxWLJw1QKbn4M1fNCTRA/Tw1nF5W0/PYpz2/u62phps8neoPWccjvWEcINI15uBzP4sR4WP
	fC9m30p7C5jrxosLk8kHhMhZWV8uWKQDZQChqpLtuYxQ1PIlY+egDwuqnNBZ5wnbWpgeCJ0/lhm
	/x2Q2TGBNVGOYDG+XgMyh3Dfpn6oG5yxKab3WizK3C7DljzQsErj8f8rjQs1UXJA+oI3cpEHtv5
	aqWmYEYgXDqHiHazJIYJKfebdUvzI2yUItHL9a6ZkLlr+DpjpeLdZcAAmmNf4e2eEhL3HhDU4KU
	ysm/z84TLJeLU+JjjC24mmtqXulZtgJiudiA/e0hiP4n2a2nBX6G1dg==
X-Received: by 2002:a17:90b:3c8a:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35c2ffb7102mr9816243a91.2.1774869831828;
        Mon, 30 Mar 2026 04:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35c2ffb7102mr9816210a91.2.1774869831315;
        Mon, 30 Mar 2026 04:23:51 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769d8337d3sm3739077a12.8.2026.03.30.04.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:23:51 -0700 (PDT)
Message-ID: <20062190-609a-4977-99be-c27df90ff321@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
 <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2NBQwVJWH-KeXnwkeEt4Bio4vg2B2-pZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfX8oVTECfQdpNR
 LVKLk0w/M2sb3noZVQIHyzPgRQvHzm8zDj+JrZtJTQcHB8DF9i0TaPrUMjtUt+pSwQkv9Q8Evch
 t385bkTz/hkv0m1RR3Vj2ixxdFrajzT3317QaqJ9bNbQC5Y5Yjs11ggwVcNziS7PfDGN2UCiG5E
 d4L1yHEkzFtTFhbH3+hEIwIA0VdU1MoeHQAnKUrJY97TEigC9dZ7W0NBfqXUFm6YgQoGORHlvDh
 0YRJo8MRTlUOjMq4ARcITrF4oO/afqe38rVjDze4Kx1yAR615g1zf2TTLb+1+hAKfWDt0LJuZQR
 PZ8lYS1s1bHHY6AG5+tYZfPz6trQNqbtoELgrFrzu8gNFqIAODYt2vvYV5xP0dWuwgD3mxSuhyZ
 N1NmqNOJ9iSSeQb0CPIELij6TVJHWyKj/2obPpHHgLw1C9f9+yZ6Ec1Dkt8Qggrqn5CoFxJjtp2
 8AEZTgySMNArJ6auKQg==
X-Proofpoint-ORIG-GUID: 2NBQwVJWH-KeXnwkeEt4Bio4vg2B2-pZ
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca5d48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=x5R1qbOTbg2SGMIGZqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-100778-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,88dc000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDF9635A45B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 3:02 PM, Konrad Dybcio wrote:
> On 3/24/26 9:51 PM, Dmitry Baryshkov wrote:
>> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>>> the QSPI controller node to enable support for this hardware.
>>>
>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 80 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>> index 75716b4a58d6..fd727924b8ca 100644
>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>>  
>>>  	};
>>>  
>>> +	qspi_opp_table: opp-table-qspi {
>>
>> Why is it not defined inside the QSPI device itself?
> 
> The QSPI device has #address-cells = <1>, so we'd get:
> 
> Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table-qspi: missing or empty reg property
> 
> Konrad

Yes, I am seeing the same warning when the OPP table is placed inline
under the QSPI node.

Given that opp-table nodes are not addressable bus devices and therefore
do not define a reg property, what would be your preferred way to model
this while keeping the DT warning‑free?

Would placing the OPP table as a sibling of the QSPI node (for example
under the same &soc scope) and referencing it via operating-points-v2 be
acceptable in this case, even though there is only a single QSPI instance?

Thanks for your guidance.

Best regards,
Viken

