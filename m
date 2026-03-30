Return-Path: <linux-arm-msm+bounces-100702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF3wNUU3ymlf6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:41:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB293575B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E797330022C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3133AE6F8;
	Mon, 30 Mar 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8SvCnf+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wg2m8og7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A813AF676
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860030; cv=pass; b=IbJZYmfh805gNCN4n+2RGbMnYbYelyjK8ToWc61ld3atx+RbsB9GKdmBK2oHym3su/7sWH7tM1xogbi3Gp6iIif8FwWCX8JCF0ovOg/bdxjuTGCpKUOF7PiUmSO9LmMxINOiKm+aJaI2lJ/4X+ZP7GZv7PzF310+GgPlmXh3+Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860030; c=relaxed/simple;
	bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaJbSzLDSO2hX9elMO1ublyyeOY6wHPGo6v7eQ1oniwf35IkuBB3BS9DSGBdsKSV4CzCoh0OvFgcgI0V/+cXvAyxxF7asCMRoqCbZbiFrecEo8w1uBs1HnlGPon9fFPO8wFZhOUu1T3z3TDL2t/FPpkrvUqc4gQMh39T7Ogr/ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8SvCnf+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wg2m8og7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78V3L4162050
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=; b=F8SvCnf+rzcEb1jr
	SP2tBjclokgByKqhpYAePnw3KG3vXyJnA4Vrr6P8HpQXbn1WnM5UXetW3bwS1+LU
	ahbmPt+1zgpR3EDj8kWYONI7+BOx0/eLkLyF35L+3x+FaCniz5wih6vijJZ55kYw
	WtFwQuqGDnJgN+3meul+yZDWzSwXl4X9tyJ/1RHfYD6W3pnuBWLrV18qB0gNBhH1
	WSs0/u51Qv0Lmmuj6bSK9B61SEVjYlxeQ39bCgIK7pk8kvQN1qf7zyOpzToDeTx/
	Nyxzrxk+12YPsAHLYCPe7J9F7Ob4LuWImkTXxV/f/6QswRkO9Zi+eMY1qYymW8LY
	yTxuEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mharatr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:40:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso136008561cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860025; cv=none;
        d=google.com; s=arc-20240605;
        b=gefsqUJEaPvtwHJrN52Qw5bREDFh+qgT9sUaANgmqOdeBMqsvhHwV3Z13eHRKJuJhc
         n5pSyDS3eZzhdczHfNdg+CDZhFRGS58qMRW6zG5pl0yd79HhX8q+AZFTYFCFIST81zbH
         lk8Rii/gUQho8hAqW/lJdYmm2cuUc2v8x8utcH4Zfo1k72/7WKyDoRLJa1qpbgYIQNac
         wXVGeGqGGErwdUrNIfQJNP35EpfRFbn7aAGRq1FyHLKB2YOpug+4GYAHy2sCs+fTQIPh
         GSXzBOlElPptAoYatwNItiScFZJ9d6PXnG0LvkpqWyIkA6reipfqlVz/NjlJ6zoo7OzY
         6PAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        fh=I2Yki8q3KDxRvJF7pL69GjgbgvG8na/C3GYPFTrVA+U=;
        b=PVuA4KmV27j2iXP7nmPKIxxBAVZ+n/ZnrZjvE96LcVRAlelpgoHDoawmupEgfj0Uma
         5WZvOj4vMRqvfBAqOASva3FryEEni7p7j7H2vyndWdO/V8QjQPWwRKUBkoZfFiRy/5Pc
         5XC234fptTwLh6iGiwfpxUlesKV6qSaa2J5LjRd0ien3CDOmt3WxkkphPL0KKB3DcqQe
         naxioeZkAGfgOoAtCdQEbz955HRBwnKYPL+h3uN90xm028ggFrAkwoFTYjV0RTRMr678
         dwMf5VJzYZ4MVK9/hXrRVzlwOeS9CUCSFZDwHAbcXTBv5HU4kGtcYlHLwqCr7H3+zcxV
         kx/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860025; x=1775464825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        b=Wg2m8og7/FEOmvQmm+DWaNSOthanxPrgtiHGoC9/aLKTUumcb2xKV8YfIpjX2aCn00
         QKAE+hc4Dl/z5bslp6Czes6ZYRr3l0YesTjZqrBPZRtENWJY5C7FtJOVKx+S5HWsyCm5
         MaKFsEUiaELymR1rP0Fmnqd+PMRHn2Rwn936wY3+xguy1oHoF83iKU+nBbgimeyuAFqp
         syLLfVbI9DOjWQGiwQWL5FRHIBN0Ow2a06krXHY8A/xKrmjvACNQP8BWTed7GqjTHEqt
         JgxiNoLj61OSFYPA2KNO2lUKT3cdTk12DZZOeinQl599rg35SiJ7JzwyFUGhxWR+a9cd
         d+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860025; x=1775464825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        b=SQZQxieciyP4f1y/LXttgs07iM4Lwg2Vljdle7ifhTY31iWzr2ID9Dqh57FAECwUqc
         Ro/HAVf9rk6Oni6ZNidXQihGiAmWcDAWVQKPT4qlbEw28oc9x4P6wBnC78yBDXKxJpUJ
         uWD2MIBKS/Xsc84yYxWmqeqTzDuXXqksEOQOTF51nzYP11yXYTWXM+yuI12v6BTgD427
         mGOEr9qDcyeLW/wT+KqbfT2qM5bPvQ30PlxyroPW54tR1Axb/8k2cauaVpXb/RnacFC4
         Os905lVeZKGhko3xFgPEctzubv3Z0tZylEauaAri3HpKwf5cHs3s8wmATyTfXQp9NJZ+
         pb7w==
X-Forwarded-Encrypted: i=1; AJvYcCU5y2ZUiSCGOlF6mMRTNeP96wAKtXCkFWrCwagZHH3LmwQJ6r0PFWze4HvB4+maZKlH4Kcqxsu5kLXeE7uU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6UKVt7UwQsZwe2phba2a0Z52O3k/uLEznwwrcIdnIx1KZbqg7
	MnBQhPr87lfTsnyFcqgkZ/y8PxMinA6xULa0SiyVmXMADNFcJ4LLcWzb/7Cmm0YT18N2sVzj0aP
	rH04QFD9Cd3xjYWRuQnFNk9oXFRBpN21bNrMR492UlKg1mtEci9cq1VUmXpzMvtnMWe9pFYp7U4
	dT/ilnzrci6qF8PcvJ/zWlU1amZPeySQIeUNfNZ6Tjvhw=
X-Gm-Gg: ATEYQzy+kjett5Z473hcqvpumPzUHyrTa8OwKWw05Mo9+dIfnW6c00ZtEaytc+dVAfz
	wWqfgI7Pg45v2sU2OzWr5MOAcSF+/LQ3f/xoidlhLY5tQT5uj3SKyhF17rm+LikA0eRNjg5qWAY
	66tpH3g/TrAWUAgg/j9UkL5DT7TCIZcJhJ6Dk4uu5lslBLo19RY9RLD88jpAJrxhRybugoNoJSe
	icW36wfENQuawqFD2dDYJKlemMmnqhXxh8QmC8=
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr159893641cf.53.1774860024915;
        Mon, 30 Mar 2026 01:40:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id
 d75a77b69052e-50ba38efe47mr159893451cf.53.1774860024529; Mon, 30 Mar 2026
 01:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:40:13 +0200
X-Gm-Features: AQROBzDa5JyLSXqlyeBHjiboYIc2tAkjG5mwWLhdd8C7uKXweA2tZXurYaWdQV4
Message-ID: <CAFEp6-3w570bA0=wRLJ_b4kwwcxVbV3zs8m3JL9nCwoDTY7tTw@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NyBTYWx0ZWRfXz0RiyimrjIiQ
 kQX1Wz6Cw4kj9YqtWzRvRuo8d8BjaV7uYaQ5vgA35CvR/DcafYjQySZGfhVNBOCfI5vh25z+gZL
 dNLFMHqFO6zaN61c7Yy0n3sDvvsubT9R+QEEnAK5RBHQu3vq0aQiPv2NnM7VPkv656FWKKupFto
 mMpLQQP1F00E96Z5jXZF03EFUXxjwwPMtBWSVYtiwD5Ayr/7GbTFt+O7D71c2/C7Mb+wTzS9Zk7
 YQDyWxNV56ENu01UniQOttFngl2CSsRGmCx9WORtKlGX4WInh7s3vqe0HUNMceBsLdwpP5E4Jll
 0+o3S0RwKWVm+/dCj4eZ6D+9h8T9aFo6ytvElXJs1p081dwDd+BpG0l5PZHZPQQ6Fm4cZuyzDkT
 drB9pdwa2GuTo78D68L71G4rQkfWwYiBVfkT1CXogUlElFHxHtW+/XuibKz/GkyBEJ+lKZHyksP
 8kkM4qbrJJB34TcSUzg==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca36f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XIB30I8Fq4NfyXnsoAUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qLC7Q5CB9W_EKkTbj6wk4BeC9rAw4Pz9
X-Proofpoint-GUID: qLC7Q5CB9W_EKkTbj6wk4BeC9rAw4Pz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100702-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6FB293575B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:32=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

