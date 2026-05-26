Return-Path: <linux-arm-msm+bounces-109736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKWXJOxNFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:38:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FA5D1C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0878A300C0C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD813CBE78;
	Tue, 26 May 2026 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ml76sZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF64dob8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A63CB902
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781096; cv=none; b=XDbIpSofTzeU7vJevckcaPK9+A8fYSs1XHOBX9Eslphfom1o3FPYIBjMyxnlbraB/dwFV3ox92urv2J4OYl2bltCsvXA4A2HCx53CG6aZgdYSU/oExc9Rzks1ejZWo+roNnZD5WE3IKBdmqgkFAZfq+Vda0U9SnhLAfGzAhky8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781096; c=relaxed/simple;
	bh=hBg+nfSw2r2A6y/6VmD3zCK2r0ocJxNLv2H3B0R5g4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gr2opkDdF4pWs20Cb8kFdKTY7MY7aoOSA4ngMht6/UoCZxnZrrR570Xg8Y8uiA/CZJJeY3KgDC70nkgqK9aPpRb/7R8G/5FkuTRKsaU9rY22x1G6BdU7Glp3gPCE5xyamNAkIU7vg8P0RJjaMfVeJYuH2X9+FVPHdFt+MlA15+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8ml76sZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF64dob8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5B8IZ1802781
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKu262Sj1Vla6Ii3OWVDDKTfHAYx8gM0SgzGiCDXG9M=; b=b8ml76sZcbkt8hQK
	sDgUYRnbog/qCZlehjI5BwlEqoFY7FBELrWAMJz0XJWnGi+1y7DWVkrWqtFYP5EM
	rP6zRGNUIofUrzIS6wkJgFX7CTCQHG+bH/1XGGe1JELq+N6twYiDfZaKGym0i914
	y2g/o1z0LHi6aY3xw0bSYt30rNLcY00VNpsu/XyjT0hO/xqgtckti4GWPU6MM+G9
	7W3hq9uyKk1NvfKCd4L7AtsBHvgsHViOgxVUvWdmqmySq7S+vGb0hpJJoJZMbs21
	j/GKlUCPziPnXcQfkDiV9nBvDYVSqO702PPTuADi9XoWQH388lzGQuyvoLuGkpdb
	9fnryw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqkjnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:38:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so9306185a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781092; x=1780385892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKu262Sj1Vla6Ii3OWVDDKTfHAYx8gM0SgzGiCDXG9M=;
        b=WF64dob8MVXSFoixJwqIyJdpDpkKI0r1gvWqZa6gZIxPikNKYbaZfJ7Krt3hJmzdl2
         dlUEeaBtxk+iT2TVffGmfPHr+Kav3KuWoETEpPnDWP9tHlwo9ozgrV3dd5jRy6Qoar5c
         x+UnMBNZuZTX1IDgPhnLBKcR0g+zKQ+UA6tDHx7NU3ceW/Q7vgxq66CjxxOBuRvUov/1
         xCuVmh+x9gGNxtDOX3ECNGdZUqvmfZRKdDvsOl2BxEbtsEhAkB9fThK2F0cgJK9xroRh
         HtQLiLuLDqjWgN/LDxeqsbL/E8anjTYQ36jOunAx66o0F2mnpCOb3O8tuD3MPu288+tD
         z8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781092; x=1780385892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKu262Sj1Vla6Ii3OWVDDKTfHAYx8gM0SgzGiCDXG9M=;
        b=n/9V/M/NpggDHuqhzOMVfPb/iH7V4cSbouZ3JQ4SWQttLI4liEkDFXdNoipt23Ti1/
         enWwJdgPCg/KCgVZa45zxJJ+l7LqmJYqpUrJvZNsLpI3F971L3ayfhD8TDHYyb2hxllj
         i1COPKgdbJRcXv5vCls4eodVez7gaiOrmXCR4SP1+2cocj/3tHe3uXHn5mW/Bg51RAhl
         NUqk6ge3oPaTAJ6oBjOnVt4yKGcIfx9zbPRhcAS8JZpPJxrh2GMpPBIx8sZxw5WktyD1
         0BMb1jlKB71zQxi33I1pmWDxRDe7ZDpVeHvIsok1cp/9bygXMRBRVU6N7PeKMf6Pvpqf
         9yZQ==
X-Gm-Message-State: AOJu0YxVqO+UnxUrUv9JcQEbFe9IfDRFCtlSxJP8yBuRQjrgJYnWBAER
	wdTmRKllZ4wKypgzjR+ymbFX5p4cJeuAUeCYOfutsVqzogHLIsagwAEny1TVYLmm2itqPk2AWUh
	Qn+XV8gSN2JK++9mbtSG6js9UovtK2uPj/6rqIMEMuFtrekKiFxQdSFN5cwYPvk6dh2A4
X-Gm-Gg: Acq92OGrsMp3hw9kGz1QKgZftglr88a9DCW7dJ5oxbPBQ2SwHu+X2MrOzDfoU3wdFL6
	fZB1Dudcv7q1Ax7bFHFsltw1m13+pxlc5Ow2EMdJdNpz/Y42WbAI8lbEA0XxUScL6QGYjuW9sXg
	pmvgdoGMAevQL5zxMJg+HCRGdTTzmFOinUgYZ2n+mqSDgl3maatCpUA4czJTUYOlLRci+FiuAuw
	o3hpVH2xfbHEnvuDrAKw+BUTJ9182PFsEtvOus7dwkPZR9W66F6EF0ekngYU+cDuPilPYT59S/Y
	/IPJ1igBRzbljvg5KxzKVMT9Yxix6PN8/rGDJvNex2YzI8sCWFCYC/Gd+9wZraeFxGhF6oezCRA
	+Ejp2m0CUZO4nfCXg9lPsLBzKeGhP+NjPllyUGBWymtXuooxflNh9pqSDk04=
X-Received: by 2002:a05:6a21:394c:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3b328f3adb3mr18196175637.38.1779781091824;
        Tue, 26 May 2026 00:38:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:394c:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3b328f3adb3mr18196142637.38.1779781091281;
        Tue, 26 May 2026 00:38:11 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b3867sm9294952a12.11.2026.05.26.00.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:38:10 -0700 (PDT)
Message-ID: <8d9f78d2-d414-4ffb-bdf2-e2e7bda73aaf@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:08:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
 <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a154de4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CbSWp4jS9IVN9doBrZEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 06K1DJD1ftSx1Hq8dEB48HhHM374PLvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX/qaY36r+Uend
 usdvUBYYzsK5MVMoJpgiH9KlwaRWKw7Al9y5UpdEsDc/oDGyrRcTWsNJhYcF7I0JD54nuM8wgOn
 yv682cJzuvD4L2Cbr7g1XILfmW8417XJbw40506p+oq+tEBjT54YfC8p90MtoppXfc3CS//b+lu
 kT7C+IYeg+BPkLY36lRrTvVU+6nac+ZmSgby1LqJPkPnHa+qzO7cz4miml2xHDzcO1BVLV2uLTx
 W79KxxOG7gMd+CZ5WjoJ2DvVpW6qGckOXcAUkRtWa4m/oqm/D7nA3qVMwCmzQ/vR9yprgcdqkze
 cmFnJiEXZUHMiJGBL+1WOgqDPsfwU8w9xuLCDEmOtK3duarsRKQ/ODXuQUkE+KgscF9AurJ7S5N
 WBNcoe0CdXs9+BggiWr9njA5cR2IUx9NmNKx2+dnVToi6u5K7tw5lKMygalRRIcn9jdbVyauJCe
 7FO9y8+kUjtbKuAw1Dg==
X-Proofpoint-GUID: 06K1DJD1ftSx1Hq8dEB48HhHM374PLvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-109736-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,4ae000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 323FA5D1C3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 3:29 PM, Konrad Dybcio wrote:
> On 5/19/26 9:05 PM, Vignesh Viswanathan wrote:
>> Add documentation for the CDSP Power Management driver, which handles
>> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
>> Power Mode (LPM) transitions via MPM handshake, and provides virtual
>> regulators for the remoteproc driver to control CDSP power rails.
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +maintainers:
>> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> +
>> +description:
>> +  The CDSP Power Management driver provides power management services for the
>> +  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
>> +  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
>> +  via MPM handshake, and provides virtual regulators that are consumed by the
>> +  CDSP remoteproc driver.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,cdsp-power
> 
> This really needs to be SoC-specific

Ack, will make it specific to ipq9650.

> 
>> +
>> +  reg:
>> +    items:
>> +      - description: MPM (Modem Power Manager) register region
>> +      - description: RSCC (RSC Configuration) register region
> 
> I was under the impression that these two belong to separate
> universes..

MPM registers are used to control the power mode for the CDSP.
RSCC region has RSCC_BR_EVENT register from where the APSS reads
which mode the CDSP wants to enter and executes the corresponding sequence
in the MPM.

> 
>> +  vdd-cx-supply:
>> +    description:
>> +      Phandle to the CX voltage regulator. This is the actual hardware regulator
>> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.
> 
> I believe the second sentence is wholly redundant

Will drop this.

> 
> [...]
> 
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        cdsp_power: cdsp-power@4ae000 {
>> +            compatible = "qcom,cdsp-power";
>> +            reg = <0x0 0x004ae000 0x0 0x1000>,
> 
> MPM is a top-level peripheral, but this is a slice dedicated to the
> CDSP so maybe it'd pass, but..
> 
>> +                  <0x0 0x26018018 0x0 0x4>;
> 
> This is a single random register within the CDSP's register space, so
> we should definitely be able to describe this better..

Will document this more clearly in the next version.

Thanks,
Vignesh
> 
> Konrad


