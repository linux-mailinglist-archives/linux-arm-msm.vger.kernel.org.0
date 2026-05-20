Return-Path: <linux-arm-msm+bounces-108823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ4hLU7WDWrW3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:42:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 581765911A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 806C3303833F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0C83EEAC4;
	Wed, 20 May 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrSuBNrw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLqIdMs6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5E33ADA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291365; cv=none; b=Izj9ZTdJPDOqYyOYu4nXXIKadYGhUNxZhpQiLyVZTaACnpu/gPc9QfDkgKiU0Ns1bFg8fNSg4Lo57thS9cxfw7ewH5IYkbC9unu5UCQDIUalnlqyUl8qm32g/8Ik4HUKBzhOGRRgcREfxMY+N1ajY+Kgz50mMwsSy7bhxCans5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291365; c=relaxed/simple;
	bh=grK9Sk8iW6KUeMq1UrYciHs9/Q7D0/UySExNCSNTiQ8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XscjpzZ+IorklFtQpQc5T/PdkePKXzuAaolc92/1k4vtgF8qArlx67XHBmacQsPOjOEsim22O9/XfXAzX+w9X7FX/X+iVFocQ2Fqs7hnGf8OPZjFEY6bXIEoDDMmnWwyrRBVuHEagdPqVt6EtzNFEe5yXDLKKl7tjKOAUizweGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrSuBNrw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLqIdMs6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFY7j963697
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LX1bOj+G5ahWYvZvTeBmcr/OlqkTeJDTD2IiN0zQbbc=; b=KrSuBNrwaiehvrIO
	FzTZf4Mvww0VyNu9V5D4NyMEDGhu1qWedER7p6bsNk9xKzqr788drW8gbj7DikpG
	IkvNtyUhGUcioPl0c9vKtl259ZgHUiOMnNid7ZTv7DB0KzxOuk4tTY/tD+KcnbYr
	9orpsnPHESIWm34aGkYt3LveZXn/KGnwyDSwGmw4rNGE8soOwoaIL+wt0RWM5H0a
	y5feACtKhuUSOnM8EiMhE4WXE5LZ8YC/Kn1bMKc7ulsCy14Nm1tzuowbdd7q07WC
	7Lc30xmVze/B5WXjuSQb2JeaRkbkQyNHuCQtmq4DZmvZZyKLsb/3U1gFuYy25Hkc
	VrM3eg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0bfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:36:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6332db4182dso8056812137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291362; x=1779896162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LX1bOj+G5ahWYvZvTeBmcr/OlqkTeJDTD2IiN0zQbbc=;
        b=HLqIdMs65WdwWWpdQXf4q+ouPcm+hNaRkNsXu9hozefZ/xNSSd63tTMEUIxEGvjx68
         ypBdPxWaWY4VRPSYpy4Gc1RX4TjeiSopK7bywB5jeQqgZpKsafckjcZy1x201fukhjeg
         zH/81ChuEZi6zSqVoLoQ4y3X3bB8jgX9jDiFvDMEa6zuMyvBD006VeGbVq50yZd+jzWQ
         ZacyvlU6HtjmJHrLC1Mj8aMciNfCfkytg568IT8T3oO43/VIRGDfcnKxnNylxluJ0xo9
         F+S713mNUct8g2HnPJFXZCbUtCqhZRnURXFZcgEFyzhhXx9fFjtU4GSfebxsrRr+FfQ+
         ubeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291362; x=1779896162;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LX1bOj+G5ahWYvZvTeBmcr/OlqkTeJDTD2IiN0zQbbc=;
        b=MfIb9DJyABHxA6uktOWtVUMCG0e4cd3ga/Lr/A7jQOybE2bIQhrJhuuy3yT+tQ2P0e
         b40tyH9dXklDk2nL/JD0A4zI6cQfAmUu46MUD70iaQlLtahKFg4g9WPD0lNH3fMe3G7W
         k14CTmZVqBeVgNBo9xh6SbSjJscvdQ5KoJL8aoZsaOEq5jkoBpBjjlba+dGUMP2RKnK5
         QPUkqpmZb7ZlLqwptoMqhh85Np2MAVgYi/gIMooY1EfxatHOjDNfmDsDDAOC55wOe9mC
         6KA3HUGIFI0QRwxA+JkHArsvPpBJsOjAZ+3IjrufHG3g/XOGOk3E1viXA2ah71ryhwL2
         jPSA==
X-Forwarded-Encrypted: i=1; AFNElJ9DPAjabBhtsxjorSy+24us/pKTXvH3I9TBGnTUCiGgHVWZTFEMZFKwn9JIkxdD64oACLFVQbSvk6vxXMtc@vger.kernel.org
X-Gm-Message-State: AOJu0YwviSeEZgVW3VA4ophRBakxhCIm5p7Y7+6VvvAMG365oJ2WdOax
	px98HxOGm519hTigI0Gb1g//AS6utKjqEGNEuJPnbMXJU1Z8Vi2QmAWqVQH0FFcQmw8/Pe8rasj
	ZB9HCHHq36DeiBZZN85XsACfCzWZl1QYkuk9knLTY79bqG33yaiSER5aM3f62YvUiBT1L
X-Gm-Gg: Acq92OFG9CvCILk07Q6k5ILEmQm0KYbBE4E9OE6QdGWMYSqEdt6fLIQrBIxcE4IAsHS
	6VApYw1gdkflH/RXiCm2+osDbEVMYyjp+MpL2ox9eDuuE/4Lhyf6ekgxjhZqv9JxUmo/xHgQDh1
	OJMRvVhRJBYvkeHeeVP0UnKgR+EvvrVbbc2IvdK8v4RXYIKXftoYmhiifPJEVMeZLxegRlxfeMI
	DECmFP3wrV56peyjSB3TACPpDoJxQSaj6lnYFSvEZ/xS8EVt5XyJaGX/A4g9KrGVywoRsSsf3pH
	Kj/SD2UqEBU+h8Ud6Bh9yA6RLQvV6wZEP1CPLys4ND/UoS46jfsgWnzN438nN0RKOz3O1no4o4N
	Owo7hh9xLaBd0fllYqv9m3Z6epybeByRwanRPSBgPoVTwpaaTf2nLcLNOJECcFWLzMnMSAImHbE
	AbXT4qfkIH9gc8J3qj74u3Til07dP2VVYeBV4Zo7svU1Cv0bU5Ju6fJACOs6ii71sOJbBetIyAf
	bOB3n+diOoL2z3M
X-Received: by 2002:a05:6102:548c:b0:637:ad7:f57 with SMTP id ada2fe7eead31-63a3f79362amr12682851137.25.1779291361528;
        Wed, 20 May 2026 08:36:01 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:637:ad7:f57 with SMTP id ada2fe7eead31-63a3f79362amr12682800137.25.1779291360918;
        Wed, 20 May 2026 08:36:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e60a76sm871298766b.53.2026.05.20.08.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:35:59 -0700 (PDT)
Message-ID: <ac8081d7-da49-4282-a967-55f726d8c384@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-13-bb1055274603@oss.qualcomm.com>
 <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dd4e2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4MUlk2DU2KS13UTX2eQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MCBTYWx0ZWRfX+d9eCo3d4I6J
 TfjO/t/oQsRkgnPQXDXpAFe7gqJr22Ffd6z3aELabYj37O7wQjSrXBJuvBk3UUI5POt69jhJ5xr
 4lFFZ1oSzYfjrWpYqAy1iyF2dxTYlqDkWWBYnN9rpgs66Sf18ZSezKMfzsd1bLtiWf0YppZ2i2F
 tPBTc5X2gEdz5D4G8giiEVBzBlokXol+/tLuKiwUOcFh/6oPDGzv2RA+DIrMwQj6DtCbwL9lvfA
 A5CdaoRkV1FixuTX+/ye/Rn46hJoTzXVO4kDuozQtoVmfc4w/IMZOgAmm3K94Qvt23Alc17gBtb
 NOZ3RRIWmtW8+q2uolkGkzdwhcmWCJzJYeUi7XXL5/EXtYkwXOShOh5hrPJtQ+nC4JejB1oboET
 BvSgZP528CN8aOoRDojnd+8euA+lg1gkNLdtZuLRTpvqU6F/UdYgwYo2zg2axjzuL5rMhc9pPNa
 i/NLI5lAp8p7pZQpypA==
X-Proofpoint-GUID: 5c1pX5keu5PKg7XGBOIFoOS1_TXtmQq6
X-Proofpoint-ORIG-GUID: 5c1pX5keu5PKg7XGBOIFoOS1_TXtmQq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-108823-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 581765911A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

On 20-May-26 17:32, johannes.goede@oss.qualcomm.com wrote:
> 3. Similar to the ope_input /dev/video# to ope_proc pad 0 propagation,
>    for the try stuff automatically propagating info from ope_proc pad 2
>    to ope_disp pad 0 will also not work. In this case it might be best to
>    just completely disable auto-propagation and rely on userspace to do
>    this itself even for the active state. Or you could do the
>    v4l2_subdev_get_locked_active_state() thing again.
> 
>    You can check userspace has done this properly by calling
>    media_pipeline_start() at stream-on time, which ensures that enabled
>    source -> sink pad links agree on the format on both sides.
>    You should probably call media_pipeline_start() regardless.

Correction this is superseeded by note 6:

> 6. There should be no propagation from /dev/video# nodes to pads, instead
>    a validate_link media-entity op should be used to check userspace has
>    properly made these line up on stream-start

So no propagation from [try|set]_fmt on /dev/video# to subdev pads should
happen at all.

Regards,

Hans

(also sorry for not cutting the large rest of the patch in my previous reply)



