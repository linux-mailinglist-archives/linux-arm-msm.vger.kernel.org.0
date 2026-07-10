Return-Path: <linux-arm-msm+bounces-118304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id psIlOlX5UGot9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:53:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8AB73B747
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:53:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LdTfWLIZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iZ8kip9e;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8200307984D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2910622579E;
	Fri, 10 Jul 2026 13:49:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C523D7C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691363; cv=none; b=kfCUpzeXwUlQEmNMDjDAg63tcLO4DpZgzYsuuW6JRpJXI5tapNlfS5sFh4c6DJ4P5ELjEdiLy2OHgfWxVtafMmfYYafqug7ucBP1Zmy4N+nBr8ECEFcKmXQ+eEsuIv/2OwTJRuOU8iXSMaHD72wtCS7xwy6zZiQIErYImJRHazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691363; c=relaxed/simple;
	bh=fNk6g2tfFQc6SajQIZ+x+Zg7++uPhKXukM74tSZhNSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ml6EQrOxQi/LRQCEIq4FPKhnPRwNLZ1vo7LSAMlDUixLbdA4x3bBBPoJgvVfHFr0Nza/j9JkoDOkPd3hKZHix8IQRB8fSUH8EDYOqPNPwiW8ugKk3huySC4RPaKlM7r50lt0MZW3QwIE6zugNJysVNEi5D6qxJ40Tn90DbYbmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdTfWLIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZ8kip9e; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD69xu790616
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhjMPYnKT+1kv7dyHHLub+f+8ul7i3f8PZu38eT1FKE=; b=LdTfWLIZnPB+i/E7
	AH2etVRa/xU5UVvJQt/1eieR8C7zYNmAyedZiYI5BUcn+v9Dgr5rV2dRPRigTFtE
	34yZCAk0tLN+rLhOBScSC4qClC/I2TI3KuPO4BJp8gsnJYJqCIi46UrV2iPNNs2L
	q5N/QgKDVKojSovhsjLX1RM3TKV0zSagSIJnLV7O7LW01fLBZH6KHmi2M+f70Zwj
	eVbCzDHhL8L/fpw/DfIeUk6CQCCHmpZOdkAl3dGkl23RvvzDjNz+dia7B8TdD56N
	1ft9U/8L3sAI34W406hMIINiEBXlpPu0YiA73MxqGVDh5L4Yehv8d7xs/iNyaPJf
	X9VGvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtba74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so2868221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691360; x=1784296160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhjMPYnKT+1kv7dyHHLub+f+8ul7i3f8PZu38eT1FKE=;
        b=iZ8kip9enD1JY5DANaSzR6J6I4cgrF05Ocmm61ZaXAwx8mhSqXxGHLlTJAJMVOyzXw
         F2aJdneI8GgK9c8Okxo4vJIuXl9WS21iX5tu12VhwcRumKFUQEIOfEBJsjCeO17lc/MS
         I6/zo3RZTIxdE3q3R7GSCmXzGo+83NKzqPN+psCgaXU3gk6Y19YE5SsKMJOWmE1tpYro
         IxlD85nICzmO/ohR62ingTuxjvgl0GiCHU7KVF/JmYukYQurEw6sM8w4RWgqy3zJq1+D
         F83BUJOtzzbZbaEeg3u4T8043e/aE9Tmb5QJDPICjDnZa0ssLq/rQ3frW1ak2smRSZBG
         neXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691360; x=1784296160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhjMPYnKT+1kv7dyHHLub+f+8ul7i3f8PZu38eT1FKE=;
        b=fhiOJY77H5KVv3x00dThxJaYRdrKJQWhGT30kWpRlik0v+9U4xCKNAYzGXAgTbVjQ6
         g3YOcXQ6rwJsoRtI91hm4xgsSo9ZHPL3J9vh3hMQIyNywjUNHp4T1dFWHs+7CNLAQCb8
         6lhOsGdgkX5NhoP5AP823fy/jUF4kMYitVeeTYzJAUfaHi8QvTyRXFFPG3deM8Mlwy7k
         OBc0cbgAKIGs9Zpu4mI9ECO56knw+yi209Nc0REcsrA9D4rqAoCiqD2+VK8TCDXtJcj6
         3bn4VJ7RuQs+3T8y5+9JgxZXPsPj4I88Ft15qCGyBLuW78F83ZU8Z4TMN2oCOmbhGWSj
         citg==
X-Gm-Message-State: AOJu0YyaI8FtZJDpp9CsEyb45vRJPDsjz8srk2s4grnFV++DX/YOc1Qo
	EGAehGMXXlKTMczpj5O7Z+pnc3Ygp6oPboPZZ7+TBL9Kf8isb6fez/je9lEEk7wrxTjrxc83FSF
	M0QoUlO5qW958tGGYzuDJN5mNIr0kL4r6tGvP2SazsVetE7wSSBkl95nofaFdWOM1kYWa
X-Gm-Gg: AfdE7ckbWDXsJ+uZtAsTwTEhViIPMNJnll5rGW7WY6cnWVAZSq4ifEfQ1uR1R5AnhBo
	+ZpUHNsvMjoq14QG0drObu8NrTbO3ZkXFjsKnoAB34gN6k8dRvhHPMHmNPDZJ6gOPevzSM9HpRC
	9Lg/ogLypZt5ZmtG2dRCblc49OtCN6HThSS7AucMSdJspAWBI8T5E8hq9MZGeD9PFJwcAUBUiEn
	fhEMj22omzcHfxhQJ40NHTbf6rYFndGdA/CyUNbCgSSMgOPpc/tKYZJe02e9vX8/QIz7iifPNn/
	nw4QnuuFPNblwPPBM1kCp5+SwZTAInZBqECFL0u5QPm4uYUsislbFdc5K49rcpFbrwab0aNphLh
	5ZO+2cr6msIt0DYJ2BVd89qla7q1nbNZ+wFs=
X-Received: by 2002:ac8:5dcc:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c966b8b25mr75444101cf.5.1783691360036;
        Fri, 10 Jul 2026 06:49:20 -0700 (PDT)
X-Received: by 2002:ac8:5dcc:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c966b8b25mr75443831cf.5.1783691359627;
        Fri, 10 Jul 2026 06:49:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15fc29937esm138763666b.22.2026.07.10.06.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:49:18 -0700 (PDT)
Message-ID: <768b6337-674f-4111-9de8-0f4a245cd275@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
 <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50f861 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XaRm8SGzVLSRUfJQwQVpXc28INKfNEXq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX6c9sfgCMZf0S
 7jdEVGoqsGh6EGpr/+DwBz24ibOS0hahlV5DXRBGFVAN215pB9AMCSK6qGhjy+bdP0XsApPDCfh
 f0HnGoqmN2qU7TZYOH5rVPhG/90KjEM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX5BMeqS+CroaT
 h365ZsqHbWaXPGgFYzYLSgufjYfkgfN5plhdgXh4mX7zOhGf5doGEfqEZH1p/SNJ9HFZZ+IMdkH
 e55SDgCXDexsuvkYGzxKg18ESOD7A6ty2WTiAYwNfE+XnikU3YMLDhobK2A0ntGx50Si4uT+bcp
 Vr297DYmhH/CH7Prae/35Y/BWoJrH1au0VcAN2ZK5IVt2DLGiMDwBxxbJ4j246GufOHB7ULKD/o
 cHsOw+WRQbKQY0rrUJxqlk5DbJvBZssXrnMw25mI78liaZhR59nGYfw/lNH/ixk3OSKZbgDO6/8
 R9JyXsmnP0vdW0ITRNd4sI7oDWXeH4iH+JZuuuu+52rKMhu/FCVFdvX+KKRydtV1n5UPEGPzEjt
 /zFfeD2WsBcbO/o6eDKmrp/VCpIaTHIfpGUJueDD+JEvfCdN/WEunkHC7RrD5NCrulTN9zR62tB
 JRrgjK3A9B3QykKeqHA==
X-Proofpoint-ORIG-GUID: XaRm8SGzVLSRUfJQwQVpXc28INKfNEXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118304-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B8AB73B747

On 7/8/26 5:49 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

