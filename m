Return-Path: <linux-arm-msm+bounces-102171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI7UBFsH1WnMzgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:32:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB503AF2EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 289DF301E713
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F14A3B8932;
	Tue,  7 Apr 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvmVEXqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g253I3A3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439E3B774A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568591; cv=pass; b=FYZ9+8K0QoJNc2TEcgIYjrAJoyMys77V2PnP5WiYP/g6rqhE8rv6YI3vEXsnqflEceZI7z0x5FmANkO7YFjmAgx+R/dOVzEBjtvAznmQFkZZ33xAsX1KX613F84M3aCYyxIfr+G4fDn3BSvYVknmN3JGAHksdY8M56Z3F89ZL4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568591; c=relaxed/simple;
	bh=GH08opCIzP2UII8cjhucDTAV7JYAVaTFgv2WFTzvq0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjpHeZQjlDq5UxEeNmCBeYrQrQkkDgOeX/TyEaQ/8uqqtG8ljdaBx2T0Dxv9bkwCiieP2zhOVUvwC/sxdIU4L/l8foDktajgp/+z435jTr62T2sOkZcOptS6EVGHiCs95VOjrSfx3Dvg0Da3wn6SrgizmqQpvk6gbYufxDlly5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvmVEXqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g253I3A3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CiZcg1403543
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfUlg6/p3UcRYQRI8+fp8gn16JLVGd2H1XgsqJV+Wew=; b=FvmVEXqJ2a4i2SDm
	y0xt6kWs56rKX7elMMEf7PmWgUMv+lJpSXbLHlY49nVxl/AAFudj225/7WJQCGe5
	LGnbD+sm5+vdO39D4uCiHbJSFt6KTgxKA+AEw720Rt0S8RVXktbIAQCu7FWBhZlR
	QJqar80wSV9N8EakuPftB3B/sAg8HxvN08Kr8mUrqRNryI0SrlY0LM8VyIrR4r4a
	+EeX38vAV9/8e1OnqnjFoICfLpCnzoz9X/9v9yxF0GUDysIZTj/cQBC3Nei/Y3kz
	M4KdG5/vFvokNEyOGueZ0K6LeizghC9e1ZyAjSt3Wr4BHTg9ZAJ8255JbTu39+ML
	cmyFsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8awhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:29:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a5f6110cadso142706976d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568588; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXtfoLuoHUDAkAN3DEpCTSjCH+2VWp4IKDm4BclI2neU0/gmmMRDy1FHXE/JdfRQMK
         ffK8uXWlkfNjRyUwcsDBMKWN9tcngfdbgaU+H2TmXMOYr41j82sJXLNqbGxcjcQ+1Ryc
         SNLig4hkVgd6AQev7/muN24InVz0Z6VmhjJw4XVzCx2PrBpnhZvs72163jscDdBJ4KFU
         ZTgc+lui7InyWB1nd4oGz/BB9iTRDlsJFBVTnLCek08o9ekWSfMoe05wdXHWEBc7svpP
         G2ii34qnTQkQ0tihIyaxJcf8k8MFMXOucWgILEhKxwTEOJhKz3weU1k9Lb8Pchxft/oO
         hSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfUlg6/p3UcRYQRI8+fp8gn16JLVGd2H1XgsqJV+Wew=;
        fh=4CAfMz81OsT9g354JEn8aSt7OI8eEswQ1txu8HpJ9GQ=;
        b=IxOn37IpdQJRvDlHw57aSJMVq5QjPzbIeHFvhgQn2+uDOxdscCKXElQbNhDuZuZ5Ay
         PZHKEgTX1cIDt6XxL09Js3OJyN2FG/ClFrVhQ2ukjnod62pTa5oMoeNX/yMCuPa6MlG4
         YXa55hl4yXL7XnmFph4F4m85cKvw8HkNsLpnPzEjm930ZWgNddIwh0s4rBCnjlrre3Yi
         bhftra/QBa2BP7YbOqgsfHDKPKSc8UMWfMeJqQExv8uNdUpdaRrd8gThJW04yaV/Ydlu
         NOt0A+6rJjq8uDWxjtiNhw6TBAx0tUi9aPvUY5/0RRLgdxNoAny7a+ZIfHAWbSn5j61R
         oynA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568588; x=1776173388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfUlg6/p3UcRYQRI8+fp8gn16JLVGd2H1XgsqJV+Wew=;
        b=g253I3A3VX1jgVxSgalyaaQEsZz3psesg+WtYv2nzow0CDmDEHkbHp+PSov8IHxjBA
         cWUQGZqxXESoWH3r9kRKzG2eXqadLDdoQBssY73bGOiLOcFgbbFjljQ6aOBCkFML3gY2
         DhKfssCvDmBHTTcg/EBjDdyv2mxvfNM+ER8rtY4pO3rKmU0i7A6LifI5m3GCrZ7jVW8m
         8sWQNQ2rQuvsj4S315sOzptds2l05pU/rZfm/Pih6kSmqakhfp07OF9AefydIeiVpjPa
         0gsKSYaJS0naJ4C/BsrKOyIukYylmcWcEUeG2P3t0UKJRfKR//tT/BLF2fCo4ImQQQdw
         +Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568588; x=1776173388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfUlg6/p3UcRYQRI8+fp8gn16JLVGd2H1XgsqJV+Wew=;
        b=CYaHjq/qEh5BhvTyX3S1Y3ETICxveKEYjm7pkjvuNFSjRKQarM+sZoCcvdwXcsGVF/
         ngTtcIF/D981EvTYy3qeWZfs9sogdOpVg4yOHCtWmxz//hgjG2gTXbsR0mtisNpQ0/MR
         qThnPrMKsEJaSlnsmppGOUktH8OjdsoSxSchRXSTDq8UYruFpfw+saw2fnGL19Ke8Z5P
         FBP2ydD7d4d67eg8LfzdTTfvhanrdIdlC0Tr0HGpxmZ3hNhbKgIw6OqNWbrvYFd+vXgo
         y+H7CvspwWCn50Q2uT8Az2dAsELi32mItM9PUY8yA5xrN4ZqEoubPKLScTuV2d241kOn
         HD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV33vyXnve4Q4dK4etUrbQT939JL7nGJ82ZwnSbBPknipFms9NZNcVYYgklTUEryytDrGoLEfvDiXs8xscm@vger.kernel.org
X-Gm-Message-State: AOJu0YxNreROncZyUVFg4CX8IGkNkm60znohTB/jCclatxYqrdMZ9Gsz
	Yc98S/fFoVFFTE1KhqfUQCkBM8kNUL5SN3QSBTcpWNLeMG8zVtW8qg25D7Bdf6K/J23pzKMLGKM
	8F8t9YZPIxWWPoKcPq0j33zAd3yC2oZpAMLpFHSO43q2uZ156u4RG9IGEjjTC45ZFAKxX2GgnTB
	FCqjPlRduaqz/FyjhH0d5YKFn4tdGkytCM55dXmGh6xlE=
X-Gm-Gg: AeBDieujDag+MC/ImZHdetMXX5pW1AGyRqM1e2v/7ZQAfdxQrGDsRql2VFxDEz9b63p
	6iNUlKVygk6uh7v/im2wCo0xYXnqRRVGj4VYZR5djV/6gkHFNkIqlEZG16QS6+mcs7OboIDbJBc
	xIacs6RE+eSiWhs4gNCBQZ8IWLyLTkI0fnIAbu5gZnQFVLE3eBm16nQg7OWLJX5tRQwdqqVvhhB
	DHPZ5ByvZ4pacaHLrDwaxTd57AtIRHAtawBKRU=
X-Received: by 2002:a05:6214:224b:b0:89a:107a:5ad with SMTP id 6a1803df08f44-8a704cb262cmr272194896d6.45.1775568587336;
        Tue, 07 Apr 2026 06:29:47 -0700 (PDT)
X-Received: by 2002:a05:6214:224b:b0:89a:107a:5ad with SMTP id
 6a1803df08f44-8a704cb262cmr272193956d6.45.1775568586661; Tue, 07 Apr 2026
 06:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-3-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-3-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:29:35 +0200
X-Gm-Features: AQROBzB9guPsHSj95s5xJmknlSRLq9G2tYjP9Qi-jDkXAyYa3xKOzzK9wQ62CE8
Message-ID: <CAFEp6-3+4T2QAkzkTuED0wYvS+CXFEiz5sbjPfEo-y4L-Z_B1w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: qcom: camss: Fix RDI streaming for CSID GEN2
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -RqOI8HoxqZPn1TgKYuJ8DjKZCyw3i8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX49R5ENIC9TGQ
 NRlbRZwQX3gxyhn3dsvkSw0J1kHp5o5kgjbr+sMNNLmzhbCu82vPpdPT6FY6WL49PQugBNZcQXf
 U07v3Wc3Lm7JAEv7DXfQRXIo3q/uJqBLwZ1fWPsp6Uyo+tVOnvwuJltGoVBexlEth7qxKbiHhFs
 DywaR0z+ptCpWIA6peNExVb6SHH719rxBCvB3HHOKbdZNPLIQa361emHvUhdVCzI0+agW3ZahH1
 arToBW3PpFn5Q66++uihH/PVN1qpu570XBlpJfpTFC+EfKBvhIeKJeah2DpzkCPhvZu/vXzVR3W
 Whl3w7KuOtjhj8Esz3s8n3wauPZbdDfrhtLdKjHaZnlKX3v6AzmpZ6cgzROYEn27Sq9yTdxGpqm
 tdUPbfjgSOhwk24nR6d+rZyJIMz/e9Gvqw5mNpB1/Mxs1/RLyGIGWq2mwf+N2mTzSxeowbfK/4o
 n4Ab9FFhT7UNhh0Kl7A==
X-Proofpoint-GUID: -RqOI8HoxqZPn1TgKYuJ8DjKZCyw3i8N
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d506cc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S2lFyeZKoY-fAVJWGp8A:9 a=vmhvOKvNfJzXYmV_:21 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102171-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: EFB503AF2EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern w=
e
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice onl=
y
> VC =3D 0 on CSIDn:RDI0 to VFEn:RDI0 works.
>
> Fix that for CSID gen2 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
>
> Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for C=
SID 170")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 47 +++++++++++-----=
------
>  1 file changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..eadcb2f7e3aaa 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -203,10 +203,10 @@ static void __csid_ctrl_rdi(struct csid_device *csi=
d, int enable, u8 rdi)
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
>  }
>
> -static void __csid_configure_testgen(struct csid_device *csid, u8 enable=
, u8 vc)
> +static void __csid_configure_testgen(struct csid_device *csid, u8 enable=
, u8 port, u8 vc)
>  {
>         struct csid_testgen_config *tg =3D &csid->testgen;
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -253,10 +253,10 @@ static void __csid_configure_testgen(struct csid_de=
vice *csid, u8 enable, u8 vc)
>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
>  {
>         /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, =
Pad 2 -> RDI1, etc. */
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -267,14 +267,14 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>          * the four least significant bits of the five bit VC
>          * bitfield to generate an internal CID value.
>          *
> -        * CSID_RDI_CFG0(vc)
> +        * CSID_RDI_CFG0(port)
>          * DT_ID : 28:27
>          * VC    : 26:22
>          * DT    : 21:16
>          *
>          * CID   : VC 3:0 << 2 | DT_ID 1:0
>          */
> -       u8 dt_id =3D vc & 0x03;
> +       u8 dt_id =3D port & 0x03;
>
>         val =3D 1 << RDI_CFG0_BYTE_CNTR_EN;
>         val |=3D 1 << RDI_CFG0_FORMAT_MEASURE_EN;
> @@ -284,56 +284,57 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>         val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
>         val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
> -       writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>
>         /* CSID_TIMESTAMP_STB_POST_IRQ */
>         val =3D 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
> -       writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_CFG1(port));
>
>         val =3D 1;
> -       writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(port));
>
>         val =3D 0;
> -       writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(port))=
;
>
>         val =3D 1;
> -       writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc=
));
> +       writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(po=
rt));
>
>         val =3D 0;
> -       writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(v=
c));
> +       writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(p=
ort));
>
>         val =3D 1;
> -       writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(vc)=
);
> +       writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(por=
t));
>
>         val =3D 0;
> -       writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(vc=
));
> +       writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(po=
rt));
>
>         val =3D 1;
> -       writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(vc=
));
> +       writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(po=
rt));
>
>         val =3D 0;
> -       writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(v=
c));
> +       writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(p=
ort));
>
>         val =3D 0;
> -       writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
>
> -       val =3D readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
> +       val =3D readl_relaxed(csid->base + CSID_RDI_CFG0(port));
>         val |=3D  enable << RDI_CFG0_ENABLE;
> -       writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         struct csid_testgen_config *tg =3D &csid->testgen;
>         u8 i;
> -       /* Loop through all enabled VCs and configure stream for each */
> +
> +       /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         if (tg->enabled)
> -                               __csid_configure_testgen(csid, enable, i)=
;
> +                               __csid_configure_testgen(csid, enable, i,=
 0);
>
> -                       __csid_configure_rdi_stream(csid, enable, i);
> -                       __csid_configure_rx(csid, &csid->phy, i);
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
>
> --
> 2.52.0
>

