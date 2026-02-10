Return-Path: <linux-arm-msm+bounces-92401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FgdLQK1immwNAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 05:33:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FE1116E24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 05:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D55763010161
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799F232AACF;
	Tue, 10 Feb 2026 04:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8XyRL3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy4B9Cn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D5329E49
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770697959; cv=none; b=PDuZnNJpUBb3UFzlGwrzLoYsdFUElcsesaB0fi+YP0sogzz5anRozmvAqu2YPemu/yBSj1U9S7oxrd/xpmzcUlAvBNtchGBT6AGQnZX4ZVDwYsWp50abf/S3K1MfcRhYrPCOu0G2olKvw0U0r0xKlxuL6f7LgD4T0SimPMay3eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770697959; c=relaxed/simple;
	bh=Kd+yrwU5/xbhFBEX/6uz6GmycP+t0I76y1YVMEJC0EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igtdxjX1lnGhR7GVTnJC/J1RzLEbnQwizj6Um6dnS9YMW0DyCu/aSZnrllGduBw8b9slIO8xYxYYhurl2xTucRkDYzwMsFVW+qk9+Rtd6XWlNK1rVV/gOuUSeCn6rLicignCCoyVx9Mnxu02Ukr7c+LTi5eWd7nhk+9f1TUT4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8XyRL3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy4B9Cn9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Hovu83699944
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zRnetKOzxqQdEaiENqW7EBVO/gE2PNAsW153vC0f7uY=; b=Y8XyRL3ZpPXjeqC/
	NId1Wdy8Kdl1NVVakdTFO/CuYHIMl/sR084uoGT4bE3PFpSGPJDnDOlYA7eL0FqR
	xf/0JngwLpZOU4irSt39Fkp9R2OperovUduX3Y5wJWMq/okMNnE8+DIP7vJkUcPp
	KbMWdfFhjKRFnsBOZniXFLXJMc92jgdTcQSEMBQErXCYKxQYpNPoZojZwZardsrB
	tkya6RE0ECHNRNAYxsrcL6afiFXIMNLN7Nv3bYJyI6ck6chh3O4mDgFiG9FHwiR8
	c6JoZrlxS9/eFRI+H2dyGY5TnVxoS2H1XPx81AxjkzNSnKCHQSDKONAkeCs2jwYC
	OuFzqw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4mb72v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:32:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b86addb8b1so276308eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 20:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770697957; x=1771302757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRnetKOzxqQdEaiENqW7EBVO/gE2PNAsW153vC0f7uY=;
        b=Uy4B9Cn939M3eG3MCVLbI5VnELo1KXxPP8h97S/5mE+JusdyZy7sEBLddLKTCpYAse
         4wDTl0TroSjUuBfYENm6Lxox8bmdLNVWa/72FDteRgcXFi+GWlFsXb+lDJjYb4NUOj4l
         Qd34ERoNT03wXnqmditXbyTALgTr5lMyzJQmakBGbgAR7f6UTWv0h+DJ/5sPjCzwEmKp
         eNVACNWhPvoq6iUSmkwKraSCeeCEu49lJ+1IHYO/bUvQj7PqkLTUtnjGagcINsA+wsw2
         S1rhM3aQN7OWSwyiI2EZlqex2t2+4+ULmmgG32V2Ilphh0a9zRuNQH3FFbMTsOzWCAwD
         3N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770697957; x=1771302757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRnetKOzxqQdEaiENqW7EBVO/gE2PNAsW153vC0f7uY=;
        b=mvgvzKjLdww1rvb07J5OJZtoJwArbBJZp5pW3ItiDplGecoON0r0u29E28I6FYKYtk
         TDCk72YWFpT+qRach6bunlCLtseG48Dmwz/N3dtq7VemnYV9tlYb1BZx/b8/1mQTWl5U
         HPHyWaaXtopcPEb5YLIDBEj0Jw30Jq8/LDJhJajXufV/x2Wr/9gm1/eYsrRis0tKJTtc
         wEGIXmTpET5aOqZWNeec6ToOxJUujfBaRwy0x6OPzd+F2CS7jrggtuQohkbP5abiNald
         iibMWAAPhYrAM0gn7OG6LhOmJ5nFjtgcpqm6FDytgL0ubEsSDKIPvXge2q3Qy2kk9oSH
         360g==
X-Forwarded-Encrypted: i=1; AJvYcCXsI4bdUODXwtYxmpIsHPOVvdi8mdB9R0uiS8hE29P4nWAjFR1E2z1s10j3MbgN56O1tiM2GUqjbXhSUdYl@vger.kernel.org
X-Gm-Message-State: AOJu0YxhxmrkIFhssRNE8qacfSz9B2gP4ZON6LGgIrqXyXfNHh3wSnQ9
	biYnhOP+n2Shbg2ApPB2Gip9t2iAxMjR3yQmfHIFiiujrePBPBN3V+mjl//rkcp1DVynow+lVeE
	O6aRahP8++s7Xxm+nFPTmMe9SmYyrfxgiWvtHgV5noHIs6aV0BLQfU5Wotucu/NSHqxdl
X-Gm-Gg: AZuq6aJ8QnLDkzEOA/rCjnwfJrRsLWc3YspoDfzx6XySgc5riVcarL4JSN/zCWlb4RY
	DbWW/pNEjbtOKT1LsLeaInJrJRk5kV02lEEw911VyLNfaL81/HzXB32g7rZBcqiLBzDS3NP3O4E
	e4KJMkajb6K1zsnpB5U7oEta4g20W3WvkVXus5CtCwzgM0GN2tB328j4V4aaV1ZQn3j3Pi8VpLd
	C+ackuhlbWHECBoZxeVOhbdyNGPxV8xTGGDfhT07dmIf6c2zIlkx5fX3p6WZszhhu1eT0o31YbE
	6hJjkWL8enFohRGu/AKdfV9l4pIuvywWCglVhereMjARiNJU3GXrZKaz1bL3am0dhaJP+oIuuOz
	2OsjK+Cz7Y38SEnKBcNh6zMSd1lOmX1khChwRa9F2wPw1phX0lGY=
X-Received: by 2002:a05:693c:60c3:b0:2b8:6b32:1cf6 with SMTP id 5a478bee46e88-2b86b3225e3mr3014719eec.32.1770697956518;
        Mon, 09 Feb 2026 20:32:36 -0800 (PST)
X-Received: by 2002:a05:693c:60c3:b0:2b8:6b32:1cf6 with SMTP id 5a478bee46e88-2b86b3225e3mr3014702eec.32.1770697955927;
        Mon, 09 Feb 2026 20:32:35 -0800 (PST)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8647bd6casm8228165eec.7.2026.02.09.20.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 20:32:35 -0800 (PST)
Message-ID: <cb0693b2-b9fd-4880-86fa-26fd1259f5b1@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 20:32:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
 <20260206145544.GA207233-robh@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260206145544.GA207233-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jFgNZiQZ765lRyAKelm6f9BeDd2CT9y2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAzNSBTYWx0ZWRfXzeotjog8d4on
 cRxyeKFnAu6dyLhqH+Okhg3GRwe4rrsX05EaNiGrNebuXd2n9DErX/Q9247P7VgFPu991r3DX23
 qgXsFIIaamj13KpBhQHxAgvhW3+TQy49cCBboP59Ku+LtW6XibygqQ4+wpvgCfskJY9tWa0fNDJ
 zR2kTCEHNxCSJ719xvBI8jiNof5/hiKLRlKDfH92Sse9aHRqNvazfB9T59UBVp0hW+QeroIsWmd
 8LZhKI6WQZgnvE5FW6OZNjKucx3R6MgETQ319nWWLAUJr+A85a4q3GaPYei8pkMc6xffROYKHCr
 C9pyZJZglUo3oCKEy0uBgCBgG9vEQcr7DBSbhRWhg0usHGDPQ2S8VMgHTYT9bwRWedLu/4iGtU3
 EsZu3nLQzQ1kU5iCvRrC+LKiZNcZ/+taoEwh83fUiCqpuy61HSt56MRyZm5KQoytx4fpcwmYgLo
 H2DAclO9TNgEWHHauiw==
X-Proofpoint-ORIG-GUID: jFgNZiQZ765lRyAKelm6f9BeDd2CT9y2
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=698ab4e5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cO4pQMiFdYyVEuTpdcgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92401-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53FE1116E24
X-Rspamd-Action: no action



On 2/6/2026 6:55 AM, Rob Herring wrote:
> On Mon, Jan 26, 2026 at 03:38:22PM -0800, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC. Each path is
>> distinct with its own HS-PHY interface, connector/controller wiring, and

[...]

>> +  supported on up to two High-Speed USB ports.
>>  
>>  properties:
>>    compatible:
>> @@ -29,26 +32,62 @@ properties:
>>      description: EUD interrupt
>>      maxItems: 1
>>  
>> -  ports:
>> -    $ref: /schemas/graph.yaml#/properties/ports
> 
> You are breaking existing users.
> 

Thanks Rob for your feedback.

The original motivation for the structural change was to make the binding
encode resources/topology that were implicit before. Specifically the EUD
intercept of the UTMI path(s) between the HS-USB PHY and the controller, and
the need to represent platforms with two independent UTMI paths. That led me
to introduce per-path nodes and a per-path PHY reference.
I outlined the constraints and rationale in this earlier thread:

https://lore.kernel.org/all/5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com/


>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^eud-path@[0-1]$":
>> +    type: object
>>      description:
>> -      These ports is to be attached to the endpoint of the DWC3 controller node
>> -      and type C connector node. The controller has the "usb-role-switch"
>> -      property.
>> +      Represents one High-Speed UTMI path that EUD intercepts. This node models
>> +      the physical data path intercepted by EUD and provides graph endpoints to
>> +      link the USB controller and the external connector associated with this path.
>>  
>>      properties:
>> -      port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> -        description: This port is to be attached to the DWC3 controller.
>> +      reg:
>> +        maxItems: 1
>> +        description: Path number
>> +
>> +      phys:
>> +        maxItems: 1
>> +        description: High-Speed USB PHY associated with this data path.
> 
> Doesn't the DWC3 node have a phys property? You don't need it twice 
> since you can walk the graph.
> 

Yes, the DWC3 node does have a `phys` property. I added a PHY reference under
EUD to make the dependency explicit, since the EUD debug module is independent
and relies on the HS‑USB PHY for its operation.

If the preferred pattern is to rely on the controller’s `phys` and discover it
by walking the graph, I’m happy to drop the duplicate reference. My only
concern was whether that makes the dependency effectively implicit—i.e., EUD’s
correctness would depend on a resource not directly referenced in its own
binding. If my understanding of how this should be expressed in the binding is
not correct, please let me know and I’ll adjust v3 accordingly.



>> +
>> +      usb-role-switch:
>> +        type: boolean
>> +        description:
>> +          Set this property if the USB port on this path is role switch capable.
>> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
>> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
>> +          between the PHY and the USB controller.
>> +
>> +      ports:
>> +        $ref: /schemas/graph.yaml#/properties/ports
>> +        description:
>> +          These ports are to be attached to the endpoint of the USB controller node
>> +          and USB connector node.
>> +
>> +        properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB controller.
>>  
>> -      port@1:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> -        description: This port is to be attached to the type C connector.
>> +          port@1:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB connector.
> 
> Both port 0 and 1 are attached to the USB controller?
>

No—only port@0 is attached to the USB controller; port@1 is attached to the USB
connector.

> Why can't you just add more port nodes to the existing binding?
> 

Do you mean extending the existing top-level ports like this?

  - port@0: USB controller0
  - port@1: USB connector0
  - port@2: USB controller1
  - port@3: USB connector1

My hesitation with a flat ports list is that it doesn’t encode which
controller/connector pair belongs to which physical path through EUD.
A graph walk starting at Conn0 could also reach USB Ctrl1, even though
these are independent paths and not interchangeable.

Below is the high‑level topology of EUD connections. In the disabled state,
EUD is transparent and UTMI traffic flows directly from USB2PHY0/1 to USB
Ctrl0/1. When EUD is enabled, the debug hub is inserted on the selected path
by the internal UTMI switch, so UTMI traffic on that path traverses the hub.
The non‑selected path continues as a direct PHY↔Controller link (EUD can be
enabled on only one path at a time).



					EUD Block
			   +------------------------------+  
			   |                              |
[Conn0]-->[USB2PHY0 ]----->|  -------- Path 0 ------------|--> [ USB Ctrl0 ]
			   |                              |  
[Conn1]-->[USB2PHY1 ]----->|  -------- Path 1 ------------|--> [ USB Ctrl1 ]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+



So to make the connector–controller relationships explicit, I kept the `ports`
property under the `eud-path@N` child nodes. Please let me know if there is a
preferable way to model this.

Thanks
Elson



