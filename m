Return-Path: <linux-arm-msm+bounces-100627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pyoIJIBWyWlQxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:42:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A4F35312C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 911B63002D38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0C43815C8;
	Sun, 29 Mar 2026 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwqMkQ0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFloK9mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50B3806A3
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802553; cv=none; b=t2FoyEYIGuWlCM5RCFIXAz4sHBgxIQMNmvmLQYFrjCxl9Vu6QeLKIhWMPJJqLVl8IlbfbG48/jmznzt0kepj62Mr+kcgfmzoqe5bFFWPBfTBJcIBsYHZTLro+kJEORNazu4KjuayGSjCYwiKbBtC1GzeqNrhhtV+YHfOiNH2t6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802553; c=relaxed/simple;
	bh=uwzCLbQOem1WVm8HUeNfdM2gQI01hklcozvnwEnoiUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxp5GIhhtgcrj8hFaC3UfhJPj7kuxkHtaNccIqW/7boGXG94lU5VGldC4lF2d2YxTKjM4WIH6+ubsx7AVd4eBr/igrPsIsIPXSbG7S+IkiKu47WA+m3HIjlAkgNKASAoCQ7VjURYWpkO2t445qX0Nce5uLbxk+PaRtH+/uX4F6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwqMkQ0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFloK9mn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi7gs1617605
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKK3nTKKBSeUwk1p9I68vE4sZcabn1NqPthGirhCbiI=; b=iwqMkQ0N37WjaoGV
	dE8ykJkGfQLnydxvQ4Si9IKqSis3MK+KX6AVcdWB2VnfycqmPKpdhGhn1wC8YpVA
	GO8/odNHWrKT7Xi6LOKDsGX70jjc5a/TrKsXmFr0GbVDrUr9iB3QGpzSESf2k4Mr
	oPfVImmd9HqUUUP5K3xes6AMgR7YtJcJWCoc4UEJn6BmSjYf0rPHqf7AJ3DdFix0
	Gi107+MaAaQFCTqPc+rEkiAjdVcYyrjYkQ3SJPXjTBaqOfcoe5w8jlTPMP+O3VFo
	CdX88xvNQtruA4Z3fCcE6qOuYBT9Od+hf95zrwlbq/DqqKhIENnIZst10ikLo9V7
	+FXQYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672ub6mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:42:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50939597b85so94413521cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774802551; x=1775407351; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tKK3nTKKBSeUwk1p9I68vE4sZcabn1NqPthGirhCbiI=;
        b=FFloK9mnRfnNp6SD5TwJwyZ4DoH1L2FcrGBxJHb+J15yF+MapKoEmTwOoQlpn3JFoS
         sqZncTpYRbPo/xXfW2CSX1Smbh8nurChvrTH2tnT9v1arQAOsdCWUkpsIE1EPaHED5eg
         xveTpspMjAsAKEjaVdjxyLjEmp98bHU6W++75iPFhwQvvTjT856RYvGRtCPjS/ksfOHh
         s58HV0diwWNthI8l/0wY38Ihd6PC6iE0kRiQwotFBazoaywgZnKBjvWMx/o5YjPV+ukB
         WY/goKHnFUOzB+Yfc8W/8F0w0fo/BsXa7CNh1VmyA4J76eSLznWEaG47EB3QiHABFQsF
         HHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802551; x=1775407351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKK3nTKKBSeUwk1p9I68vE4sZcabn1NqPthGirhCbiI=;
        b=UY6QTY9r24VljlqHGfIUbf138JuKg4GqrvWOlJPJMjGhsOs1ZJx1nda3GzjBWens9z
         mQt6PSrG5Q3wdINV+nGWnWzKloAEGlBKfImjzFkeWuy/KPDXYzkkTElEc0BQF2SpDyRF
         VfvLIs0sgFeZXqtKiHfWyabwcEBkb2oQdwtLTTuO7EhfNE/VBMST/U6XCmc0wGVKQL3B
         CofNuF/em2JWHGyaH6Z3fFTY34wZ56X4nDXv6zbvyjvQw5NFg8PRysLjiPfB6DWMq+Zp
         teL9r92VR1odJk7jprNXdNzkvziSm7zBq6LDqh213D4GWpKa8ufXwuIxoGJ4bT6rF8WW
         MwPw==
X-Forwarded-Encrypted: i=1; AJvYcCWviynJhStaBquw1F5qW1Py9zBwy4gv+IoNuOZlXzETUwLybu+KRGNPuIyITYJUDsS2Sk9d/7wrs42F0Ieh@vger.kernel.org
X-Gm-Message-State: AOJu0YwDobYZ9KGeo6VZMdVGrTMKh7WawVM8soyKu1vo3Wt5bpVGc7Q7
	OrwmFwt5Yv4b8o7j1exDz//CG/rSKsr2g2bQA3B1qgkZCty/LstLZEwtY4+2qstN8uKM2lYO4II
	WUbCeWUczX//sdlT6b2ww86UOeQPPgxfZiWUxbbfvSn/mtYjLQAun4qvkKCvVkIWy5RB6
X-Gm-Gg: ATEYQzyCl5kp5YMbZ66/jSS+AsLraTTH62Fsh+/+ChOHEpFpp5n3T30yJHW9ZugVIIb
	+xWoMhD5JK4Jxb4Vn4DfPoJA2NVclKq+ABg+lFP4JnmfIDYfZe/jWIRbK0sdgDH/f5IWk2do3RJ
	vcfLg1D2kTpZkw+nA+twr4ZhETzejAgY2JsUAsZMDo/fBFx9AnoPFTLF78nw5K9HF182ZFGr9hY
	eez9nD/YRNni/mTf77Rczf3OgebdOU605iB4YNZgNquAa/AZ8onWmpISYo1smJ3Om9NkUun0Ukc
	rynBG0ahML7gJUI3J2H8Z3vUiHVoznRcainOFa/gRgHDtWGxQ2/xnDFOjdWXFEVIM7dqEqwL96U
	5TW8RoyKXSgYERu1KgGlxl0ZzBx8KIiJ8rwyubfv/X/7g37lRha49swBmj7Rr0mj7C7Uv9lheB5
	Y1MaJEufozk4iFANDllZpHNgkqZEUQzrNRQkg=
X-Received: by 2002:a05:622a:229d:b0:509:1220:dc21 with SMTP id d75a77b69052e-50ba397bc77mr141869701cf.55.1774802550616;
        Sun, 29 Mar 2026 09:42:30 -0700 (PDT)
X-Received: by 2002:a05:622a:229d:b0:509:1220:dc21 with SMTP id d75a77b69052e-50ba397bc77mr141869391cf.55.1774802550152;
        Sun, 29 Mar 2026 09:42:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd4a8sm1118952e87.20.2026.03.29.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:42:27 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:42:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: connector: Add =?utf-8?Q?role?=
 =?utf-8?B?4oCRc3dpdGNo?= provider phandle
Message-ID: <g2wzyy5fctdcfhvgjgokgvm3h4jk6q2mldv3yum5fwg6qbwtov@mjsg7z2hkhyk>
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
 <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
 <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
 <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
 <a25ecdb4-1140-41e7-8007-8aadbe5c207c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a25ecdb4-1140-41e7-8007-8aadbe5c207c@oss.qualcomm.com>
X-Proofpoint-GUID: PM8SGUiKuDDpk-7iLMMNutx5iqqzkEOs
X-Proofpoint-ORIG-GUID: PM8SGUiKuDDpk-7iLMMNutx5iqqzkEOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMCBTYWx0ZWRfX3pHnROwIbk91
 onm8yRvJ8OnyGMOw8laRvp1UdvYtwKpXp7xkiWh5UPJ3bfbU/VO6pOOyx7vsYRhSIB1940laJBN
 yE5T+zsyTYL8/ABf+yy7ZTTnvcD4YtTmbOeJaDO/Dd19T97Bje7yn3g94RsrFNSNsfnjgnJil01
 dnF4mcEeI2MC1UVXz5gAChlQYVZeqHCEqW9JW5iNorr8vMAws/NMeFEHJgFPsGS2Cx1rXZc5Swj
 Vhdhr6ytGBqe9PViNvX7C6yU6PzG7pUntCuB2wqnEuZXRhSmTKVB5HDcqRVVx88j/3+iVDZY9gz
 t+YwydmBhuwWPWE8LdvScUQcsDUY4co98brLuxJVD40dz+oDRGnn6c8Y5ExmQVqvBsUKlHp83vM
 gnmJO5m8q3boFtRRACEhgPzu0AP1JbmgtSxjh2G67T0LQgOeeCU7s5IomLU5cxfY+A5Yuvww7HJ
 L5kuKj5z+IVmiqAQyEA==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c95677 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ydf537zT96yqHWd-HkQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290130
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100627-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76A4F35312C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:50:26AM -0700, Elson Serrao wrote:
> 
> 
> On 3/25/2026 6:57 PM, Dmitry Baryshkov wrote:
> > On Thu, 26 Mar 2026 at 03:49, Elson Serrao
> > <elson.serrao@oss.qualcomm.com> wrote:
> >>
> 
> [...]
> 
> >>>
> >>> Previously we didn't have such an issue for the usb-role-switch,
> >>> because there always have been a direct link between the USB connector
> >>> (be it gpio-usb-b-connector or usb-c-connector) and the USB controller
> >>> (implementing usb-role-switch). As with the EUD this is no longer a
> >>> case, my suggestion would be to follow prior art and let EUD receive,
> >>> interpret and resend usb-role-switch events.
> >>>
> >>
> >> In this topology, the EUD hardware spans more than one independent
> >> role-switch relationship, as a single EUD node is the direct neighbor of
> >> multiple connectors. This introduces additional considerations around
> >> role-switch discovery.
> >>
> >> One practical consideration if the EUD registers multiple role-switch
> >> instances is that fwnode_usb_role_switch_get() ( which relies on
> >> class_find_device_by_fwnode API), assumes a unique firmware node per
> >> role-switch instance. If multiple role-switch instances are registered
> >> against the same firmware node (the EUD fwnode), the lookup will return
> >> only the first registered instance, making it difficult for a connector to
> >> reliably bind to its intended role-switch provider.
> >>
> >> Supporting multiple role-switch instances in this model would therefore
> >> require extending the lookup mechanism to allow additional disambiguation
> >> (for example, associating role-switch instances with connector context).
> >>
> >> I want to make sure I clearly understand the intended modeling and whether
> >> these USB role-switch framework implications are considered acceptable.
> > 
> > As far as I can see, you can register two usb-role-switches, one per
> > the EUD path. then the connector will still be able to discover
> > correct switch by following the chain from the connector. On the other
> > hand, the EUD driver can use fwnode_usb_role_switch_get() passing the
> > path's fwnode and find the next role-switch connected to the each of
> > the EUD ports / paths.
> > 
> 
> My earlier questions were primarily around a flattened ports representation.
> I agree that modeling each EUD path as a distinct child node with its own
> firmware node addresses those concerns cleanly.
> 
> For context, the existing EUD binding [1] models a single controller ↔
> connector relationship using a flat top-level ports block. An earlier
> attempt [2] to reinterpret that top-level structure to represent
> multiple paths ran into DT ABI concerns, as it changed the meaning of
> existing bindings.
> 
> Based on your example, my understanding is that the intended direction is
> to keep the existing top-level `ports` semantics unchanged for backward
> compatibility, and model multi-path hardware using explicit child nodes,
> each representing one controller ↔ connector relationship and registering
> a separate usb-role-switch instance.

I'd say, it is a good idea. This matches the port / ports case, where we
don't create ports node if we know that there will be only ports@0 node.
Likewise you can have only one OF graph if there is only one path (for
backwards compatibility) and add subnodes if there is more than one.

> 
> Please let me know if this matches the intended direction.
> 
> For the purposes of the usb‑role‑switch discussion, the other feedback in
> [2] around PHY handling is orthogonal and will be addressed in a follow‑up
> revision.
> 
> Thanks,
> Elson
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml?h=v7.0-rc5
> [2] https://lore.kernel.org/all/20260126233830.2193816-2-elson.serrao@oss.qualcomm.com/
> 
> > Here I am assuming that EUD device structured in a way like:
> > 
> > eud {
> >   compatible = "qcom,eud";
> > 
> >   path@0 {
> >     ports {
> >       port@0 {
> >         endpoint {
> >           remote-endpoint = <&usb_con_0_hs>;
> >         };
> >       };
> >       port@1 {
> >         endpoint {
> >           remote-endpoint = <&usb0_hs>;
> >         };
> >       };
> >     };
> >   };
> > 
> >   path@1 {
> >     ports {
> >       port@0 {
> >         endpoint {
> >           remote-endpoint = <&usb_con_1_hs>;
> >         };
> >       };
> >       port@1 {
> >         endpoint {
> >           remote-endpoint = <&usb1_hs>;
> >         };
> >       };
> >     };
> >   };
> > 
> > };
> > 

-- 
With best wishes
Dmitry

