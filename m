Return-Path: <linux-arm-msm+bounces-118167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dAYJC8OTUGqG1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A911737C29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X8iCJmMF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F9T1L2oZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BE913005EA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4DB3B2FDD;
	Fri, 10 Jul 2026 06:39:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2A3B27C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665593; cv=none; b=YlBkBJF5JLkb1kaYy7Ug3whdJIGNiCyjhfUOfIyyPX5Lb3XhAgX//esCNOxGEKgOdl+/TI3+PDp7CNoc4zWXqOPEi53z8uMT3bPY2/JjZmRe7dS+owFyhMrrj7KtIzQXBm3lwaTwZ0qCukewq0Ykn0yd8/eBodfJbLwF+yh8IyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665593; c=relaxed/simple;
	bh=GjPLiNk5kURIAhDWZegJ8UV9Fu+vWfE2XaV7dhLeeYw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I/9mbk9rl4FAMhYyZQtqjh/CY0gha25cp5eiecm2qVBxhWdu9GDg6ILuNvY467K3wdBD+TvdfGx/+NLw6PkMWYB+gNumZxzl1AiMwoLM7Ieyi4FntUX6p7HGzthBmi3n1s/WlLYbcaZ5mVvUluY/qC9k65SnYt55uFM0nEnHzTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8iCJmMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9T1L2oZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mtKl3721337
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EW5YB1F8FHpFPJHBNFxgrJ
	BQVmDA7bsp9InxtpYa5Q0=; b=X8iCJmMFk0LVPIFxQ7OEgYxTbgUdkoOTZgiGGo
	/7TK3VwjnBLg6JoaFk3mEznVXn7SGf+RBD0VKePJuLYtaJeYN3AQQ23IGsmqAmEX
	Jz1arM/g42ey9fPAY3PfDANTb4fp934vW8Ue/RRsrB1GTGM1N6Mx/FBhP02jq54J
	fsJUFZDQRGQKBv2dqP/3Z7b6GjXgSbvawTh9U2IIbs8t2VyAyS+iuxw7AeQLFXw0
	X6d96D9usFPufdXWqHz91/yLGx9TMlGJiNagF4SB3fGozttp6dATqCm5lnsB/fJy
	MrnbJUYRL4jkugZN/OMexDb6EZjUsHCLT46/aGnBw4YEqH7A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwt9r2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8952346bb9so470248a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665588; x=1784270388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EW5YB1F8FHpFPJHBNFxgrJBQVmDA7bsp9InxtpYa5Q0=;
        b=F9T1L2oZbXxfCJXQ+tRq2N6Czhzf2UEc/Xtzk2BwvjQLmc5IjeqZZh+xkz+lnsgJiQ
         roU45ZOfaojOstEy0aWdAhPXZWbw1C8aees1qvy1UAuhI5PcMXziYHwfK7m1FX5ZYDQb
         dtaANKLmXxTNEF054mchduToV8ObN05XwaElvPlU3DdsEF/vE5nS2VF6Kbl2ulV47gad
         ksfqDvQKaHHW03PyWa2Ot0Zr53i37Hmb7GUBaGTE6wHBLTXfMaekIWgvkwsqXj5y07rz
         TNHCodRGIq+LcqTSDPZBtpJANL0a/+pc2QKqHNlXPheKiwKxWnUCwDuBo/b1GHoO1YDs
         9SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665588; x=1784270388;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EW5YB1F8FHpFPJHBNFxgrJBQVmDA7bsp9InxtpYa5Q0=;
        b=P/h+s/zD8kYFiEyUxDOWYBmhNEDoCf+dty3v/Rsl6CMHiF08T9AxpYaXvvX/ZdTdb4
         G3zN2wlwyfAxJF4h4yUJ/07VMrce1iOUmYV/s1tstfwRQrFzYnKsPITiWOAa1iv073m8
         xfcQUhDa/nX4NMEiMeWyzPTyiC6zngTQKWcu8hmom6cVvM583Xy/EjGj86yLrqnjmTjk
         4W8qZ6rqevdbM3QEFP0v3nSwg1j2hZ2FsoxMs1xdC7nLrd5M3PsxrYDGxp6yhrgOpuHi
         9+WWf2f8egKwYWTsG1XTXRLUzoQgngUq8RicpfI1bY5qdPPyJlslvBgvKwpZ7rBxpCg0
         J/MA==
X-Gm-Message-State: AOJu0YwCnGeUpVQHM2QzsxbzeqzNOMPrfA0LbhRuffcekI0KIb8KLMff
	8pzWjx7GGv8oYDQ6Fx/aIELorKSjl6QQpoLYOSpCpEf/HIQH8piEHQLijJYLJbqJDqJCYx7snOb
	i4AmJ/gSsck8tTTM14xPQyD0pe3AjifFzFOEJ6yeWoajO8OvoozxbY7//RUkK4hSCniBl
X-Gm-Gg: AfdE7clZXjun1by4iucqwc1hdTE8/p6ByrL2HG6TwQ2+5QjdmhIRUlQUneuEBSVlWyI
	49Zjk4TfLCn4htoqW7EXIHc6ry7orzAfo0o1h1w/kSwNynUNdKpYUWdUsij7dW25bxTHn/+c6hm
	kFdrAlCsJa3NFm2+tlfTJq8NVl/lagUie6r6UDL8JsRk5Ksgwf3jIfzYtkm1cfL9g3F9SBZfBwp
	QTQZA4KMrHvbbBFcHu+MNhmztdrdVGNB+dRunn5JrJNwdy5flM6NovKtc+Po0Wd8NMhwvdIdsrE
	IuQqZTFsFzHTE+SFbbHuYs9SjvyzyX8piBy1wbGuVGvuGazCwx0rwnvtEfeKEv/mDx21xt0pqcM
	ajYguIskb5tO/dqtkFRDarXbggRIdjHl5kJcHLTGeCXl8ah7OkbTYPhXccvz5
X-Received: by 2002:a05:6a21:4e02:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3c0bd0f8fdemr11786914637.47.1783665587884;
        Thu, 09 Jul 2026 23:39:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e02:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3c0bd0f8fdemr11786870637.47.1783665587359;
        Thu, 09 Jul 2026 23:39:47 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:46 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Thu, 09 Jul 2026 23:39:41 -0700
Message-Id: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2TUGoC/23NQQ6CMBAF0KuQri0ZSyniynsYF1BaqBGKHSASw
 t1tMSZq3Ezykz/vLwSVMwrJMVqIU5NBYzsfxC4isim6WlFT+UwYMAEZMFrf5nZ0FK2UPT3oFKq
 cZ1rAnviX3iltHht3vrwyjuVVySEYodEYHKybt72Jh96bTr7piVOgZQZCcpmXiWInixjfx+Imb
 dvG/pCwMKWfRvZjpN6ANMnzRIMUWv0x1nV9AvvfgH8FAQAA
X-Change-ID: 20260702-glymur-soccp-8f50d947f601
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=4740;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=GjPLiNk5kURIAhDWZegJ8UV9Fu+vWfE2XaV7dhLeeYw=;
 b=8eJrPBaStZIimBxa3XctHLPhaamivcJaclrfJmuwB8xMFRWkMvX0bPwQtjbZYd57uqFY7NZqA
 07lkVRsn1M2B0buZeaR09js7rqJ/KD0r1vRbRmycXFkEWQ4S7JKF57r
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a5093b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEyMePVOpC-_YXVUAVYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: -g-7946za792JhwTSSSpfXUMGEALdrFL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX7IbUBvIctJg/
 8sSyIjS2iPEPU1r294u8MY82145n05M02YY8xiW1Ji6B7vpdwqyomWMJNt15dQrZyKWB5zju9mp
 rhh/3/1GRfhoZn99onJ6KwuC87PP3Sg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXwYBqiEQmffRo
 p6PWxo1azIwlymn6k7996uTeEpJqAPwaUVixmfXpbwiCjd0GJ7ZV8HnfmDp0l/Vv8TQ/Tr4ec8X
 SeLfBe6n/uDWKpI+deTe5Zz1wIyfplGYKSd13AiOEbZ89aKa45WTIpnPLV2cMJlkkiK1Qb8bVZd
 OgwSksgejdgO31Muci4zfvjRrQT2Cpjq4w4Rs9AKUOdenG+zEKHWhsH1MhKmDKj10sIcwfrLRF8
 zxrsLRAWi6TBLIjLQOQh1a8nQR+rfu+NfgGBKnqx0zLrlEXmJE430vgfbWqO3S/wqE+/eeh6jq1
 8CdpWYkI6RJYuVwDcuPStFUfPTZYP3CugwliH6lsXjYdsve0/1JJILuM/ue/WH3kdd39oRDzDyc
 Tig6MD9t/O/Bc1+mrNX+6Dwn9N4P4QhhduQo1G0eCmnx9z+VA9rkTbghSUuett+0pfyBkvmCadh
 1bCMet/OlVyBT9mCpxg==
X-Proofpoint-ORIG-GUID: -g-7946za792JhwTSSSpfXUMGEALdrFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118167-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:jingyi.wang@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:abelvesa@kernel.org,m:qiang.yu@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A911737C29

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
This series add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

It also introduces the needs_tzmem flag which would cover for certain edge
cases by serving as an alternate trigger to the PAS helpers to ensure that
SHM bridge is established on SoCs running non-Gunyah based Hypervisors. This
change is required for SSR to work on SoCCP on Glymur.

Since Kaanapali SoCCP does not require or enable needs_tzmem, SoCCP falling
back to qcom,kaanapali-soccp-pas binding will break SSR on Glymur. Hence
qcom,glymur-soccp-pas is decoupled from the former and added standalone
(simply dropping the fallback would result in a dtbs_check failure).

We added SoCCP SSR verification support in diag upstream. SoCCP SSR on
Glymur can be triggered using the following commands using diag:
  error fatal: send_data 75 37 03 152 00
  wdog bite: send_data 75 37 03 152 01
  Software exception (Null pointer): send_data 75 37 03 152 02
  software exception (div by 0): send_data 75 37 03 152 03

/ # send_data 75 37 03 152 03
75 37 3 152
/ # qcom_q6v5_pas d00000.remoteproc: fatal error received: EX:idle:0x0xa90cc050:PC=0xa8eb5d8c:LR=0xa8fe5b3a:CAUSE=0xb:REASON=0x4
 remoteproc remoteproc0: crash detected in soccp: type fatal error
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 remoteproc remoteproc0: handling crash #4 in soccp
 remoteproc remoteproc0: recovering soccp
 ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI write request: -104
 remoteproc remoteproc0: stopped remote processor soccp
 usb 3-1: USB disconnect, device number 3
 usb 5-1: USB disconnect, device number 2
 r8152-cfgselector 5-1.3: USB disconnect, device number 3
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
 remoteproc remoteproc0: remote processor soccp is now up

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Changes in v6:
  - decoupled qcom,glymur-soccp-pas from qcom,kaanapali-soccp-pas and added it standalone
  - dropped qcom,kaanapali-soccp-pas fallback
  - dropped status = "okay" in glymur-crd.dtsi for remoteproc_soccp, as it is never disabled
  - picked up "Reviewed-by"
  - Link to v5: https://patch.msgid.link/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com

Changes in v5:
  - sorted soccp memory regions in ascending order
  - readded qcom,kaanapali-soccp-pas compatible as fallback
  - updated commit messages
  - Link to v4: https://patch.msgid.link/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com

Changes in v4:
  - dropped soccp from remoteproc node name
  - dropped status=disabled
  - added a new needs_tzmem flag in qcom_q6v5_pas platform driver, and added glymur_soccp_resource
    which uses the flag
  - dropped qcom,kaanapali-soccp-pas compatible, due to the kaanapali_soccp_resource not having the
    needs_tzmem flag enabled
  - fixed memory region mappings for glymur soccp
  - Link to v3: https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com

Changes in v3:
  - dropped smp2p nodes which are already merged, and adsp and cdsp nodes
  - updated interrupts-extended (dropped  <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>), interrupt-names
    (dropped wake-ack), smem-states (dropped <&soccp_smp2p_out 10>, <&soccp_smp2p_out 9>), and
    smem-state-names (dropped wakeup, sleep)
  - fixed IPCC names, GLYMUR_MPROC_SOCCP -> IPCC_MPROC_SOCCP
  - Link to v2: https://lore.kernel.org/lkml/20250925-v3_glymur_introduction-v2-24-8e1533a58d2d@oss.qualcomm.com/

Changes in v2:
  - None related to soccp
  - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

---
Ananthu C V (3):
      dt-bindings: remoteproc: qcom: move glymur SoCCP pas to standalone
      remoteproc: qcom: pas: add needs_tzmem flag to trigger shmbridge creation
      arm64: dts: qcom: fix SoCCP memory mappings for Glymur

Sibi Sankar (1):
      arm64: dts: qcom: add SoCCP DT node for Glymur

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  2 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  5 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 52 ++++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 +++++++++-
 4 files changed, 76 insertions(+), 7 deletions(-)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260702-glymur-soccp-8f50d947f601

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>


