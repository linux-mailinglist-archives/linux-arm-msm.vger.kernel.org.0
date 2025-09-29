Return-Path: <linux-arm-msm+bounces-75490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF34BA8905
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBBE2175C16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 09:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7231A5B92;
	Mon, 29 Sep 2025 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="T2sdXsUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5661283FCB;
	Mon, 29 Sep 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759137274; cv=none; b=H3xWeXd/lFrGfpo4IDoUj8FZp5PZKwdcQh/NWPCEqJtGTQXO+Of2yKUdqWSeN/CHAzQ1Hjtz4nJMMP4SDXsZdp+RlEeHRpGbcmSPyKri+W9wtoVGTC/wLYWGGbD9EoIFVg+wZakH2zY+Sjy+NNGQRUXVVGG3CWeBDCD30vv5yW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759137274; c=relaxed/simple;
	bh=Fnk6Ccubd+tiZ1vjJoUqDJVTlu105A6rXCEb5d5pDPE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=F5QJbhbYWIjArc5M1TNaC5gTVkOtT42sL8dTOVT56EOLKcZ/7A+8qXunZ3FMtJQQF2vu4MbONCSmFjjZMSboSEtP97IFbtRZLRTslpobLnaF0qSlTtDxTYBhMzr8jFpepeQZ3KRRsgdnPAoE7V2rw5mVa4tM+NgPPZvpu+SQ9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=T2sdXsUz; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759137270; x=1759742070; i=markus.elfring@web.de;
	bh=W6Qxz43yoW8ZAOOOIXfwMNnKY9amqkgZI/6QKIiOkTE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T2sdXsUzaaWw6Hbr8z1HRbM+vtUV3l2GtIKJpL8NAXJ9ZuLyIUsC58VOmIq6QOPy
	 jxWkdEKexLPkq+A2G48ZQrl35U0Q20S5ID1TcEeSJJHY9Ah24tSv8JNt5cQ4ilFvA
	 4D3Z7mfdkFHPgYnBJpeOR/BpuVdEnFPopFuxBX2FPU/icwsHrPFfKZohHzS1i3pcL
	 SHFPNe/WyuauGnnY4jTg4Jfya+cDIehVBFXTU6hLh9lm8JsryLDARNqN09mSqXRFs
	 uwTWOxKbDAug3l9OQpy9DCSOOKrP0A+cYaDUig157YcA0I02fDBoOwVmKXW2v0NV+
	 tUeGAguwNtbR/U9Lvg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.245]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MOUtm-1ufRsJ3vVG-00MMog; Mon, 29
 Sep 2025 11:14:29 +0200
Message-ID: <97a640d0-d80c-4c96-8204-719493d258aa@web.de>
Date: Mon, 29 Sep 2025 11:14:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Sumit Kumar <sumit.kumar@oss.qualcomm.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
 Subramanian Ananthanarayanan
 <subramanian.ananthanarayanan@oss.qualcomm.com>,
 Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250923-loopback_mhi-v1-1-8618f31f44aa@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] bus: mhi: host: Add loopback driver with sysfs
 interface
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250923-loopback_mhi-v1-1-8618f31f44aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K4UCCWKCriTwnAuuANgNpqrqRtxYHCAtuI2jWcCxjcYwkCrAK2v
 Ws/V3CkC2xrZcKpJ11PCHeNkTH4gJB+Q8adrzI3htoLsMcI2/gjHwhLzVNHJ2zpqo03kel+
 0Unr1UUcoHKO1e+xQaL01Bi0GjoGI9fJManCuamQzzvPNAvqIs8jVNbj3CaPH3MlMRb7yoK
 q2cWJZ5T0ei7oPJVhYLtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:toF/ISkDl1s=;nnLzqWa/1IhkJcSCW1nM5MTqprS
 7jjA+sEedf2y66MAvp7h1gjAEJS2p+88xq8MjcQADA5GzkCpbFM5ePt96Bpp9sljhPr9OVRrY
 NeWRpysICjUsU01r/fyEo5rCmgwScvVemSzkP330ZxjR8mwB7/9PqLzq5qsNXpbRl5h9KyTNZ
 YvsMgaOSW8oYZugpGsSmz3ne+0qoGy9lAXT79RAiQ93OvaUBAxCgYKNP7mWuCF+9Fvq6zsurH
 dvQjftIM8Mtx2Ap7db33jwXOIbIIWF3gE02jWxGZTa+cjNtHFjsZthVxdRNJK+tUwN6QdaRKN
 xwgwQpZQcXplo93IsTdNC4y1tP3m0dSmBU+65iwk3dLC1ShJnKVJirqzby7HwAeFdSkkFCHQZ
 kctLhoYLZVC5mg4Rco5HFo33GnqdXgYEPr4uIiqnMG5KyBkIBzinU6DC18FOd0aqiuQVb8/6o
 w2DRb7zwmRdMnsNJ2Mh3K7aUayfywxC6v09qHfWqNxGD5bzBxz7Q9MjUVmw7BAzH8vpi28L4Q
 r640LNIk6pUmimMHKu1SzgbgQOqN7a9WkY8diLEhB66JMMvGONg3hz8kXcYAR4jBuvhI720am
 U6mdVGFMEun+XXUhdKUhadFDXcMhsxVNHqFsGHzuUm+Ynt1ZLCQH/0rxq/hhs8JkOGiSQIayu
 UsvTsCM+JGADxrAL61UCq8DZXDYNTEYZAqeKxNGTNut3iMQKgaxCNQhgECwAba4nZcFrryCHX
 y//LJZPW98D11Tc5uqoLLXbeV7RJLW8pWglNAcm6ZrcY+DUJHBfWGFuKBqnWMrmvf03m0fttS
 iOz7RO6O5VnEBVP/6ydmxsfNtjU/+kDbKBc3roJnQfX2q8LsasGQ2/kRZXDRGccmfVOuODqOI
 dfyCI0ycjqga/9a3NV5Jsslls5mIDH/ZYxaUJ6JdHnnweKdoyKrYZO/I6dlnVal9GieXW17t+
 SaILNwtAmINFf+eHsdM/aChyY2RHpxXxTsuOygh+RVDzIt0oJoLhvkNKzIW1OeU98sH8D0e7E
 H4trpPCjZLojSDt1Xlb78sr8OXBdiWbTNy3Exu/7z/vPFw/MCq9d2IgLXFhYyWO3nZk8PlMVi
 +xXr8g5OurcQ6J8vRcXTbo1/+hvomssnFRREtk7D35nE9Zsl9+ZBF9SlGC1/MP2LD6NqEYNUn
 yD1/Z7Hc2k7H7mw1J/XrNUoEeptxtL6BPAEjwu9Tn6axridaZ7wir2EYeE4wwy56FLIO0qXVM
 1GJQ73rZqYLqQAlq40DUfbnZiBNtF3j+D4FzOVeCj0mk+HvXVD9xJ3SZnafNJhjIT8yMW6NQc
 5HcoL5V4p8OXp/O44gr82KxSb6xE/UPOlb1X3ONk/+uduVfFrNu7uwJaWJUyIyydoqchVSPd0
 GQ6VgtTLTAxt/ukIzsgxW9mnl76EUJ7k+dEi7Xpvhu6bH7NidBNrzkw925pORl8YTyvKvcOU8
 7gru+AWSd82ingaG9SJ/Pd/VWpaoJ9V5nwGm1OkEB4q9BS3Gb7p66zq0TaTINo2bk25vxbeGu
 3ur7sTvSgZCptMfOUcODbZRZKQjPqbFOjKQRBgKVHn/XmR+zjXpjEhDClnGLMIISKSNMV2kiy
 UVIzftGv7pudEAgnTJXrY5PNuFG4B1j71RqV3nN8prRftyObrrUagecJgTu6gKL/NF3KNAcSu
 S1Vkq48ExV3v3pENMvyQBqWHqw7V9hKJVcm88nqRTbLx14kLfSI9lJFTWv9aAWMXOAHnr5Cbb
 yKfZfV/o7SjBSOD4uC/1dA/k2OBT9Y/jcKKJmBGbTSHQztduC04lQCcfwU1m69rkHLs2nSfIW
 SoV0kt85yRBvYtoshnRhRi4PE68/v7jmyHnPecXef0jSWsuFwutq5tE3SHnLnetYYexJfWFrt
 Bcxyqmhn5ZBNSaAA280K8/p15pR0B8MOLwOsasFKu/6GUgwTT/ICteDn/L0rL4i2i8wkJw7Cm
 KR10iluiSkiX8RCvG8uZDp/gHn0XhSvG+AbNG1gkqh1rbTSwP4Yb4ovNOkUBJCoDRuW4+nVz6
 xVnMi/jR004i3NmP1bDuvS66O1zFs1400zhlIutYwvSjYHJTu1nDzygoMaNE4KQolGD3VazYu
 XA68vvcFQp2XqYcp3jr9m6UAEU7pYdLdLzyL9xS3GRFk3bXPK56Wlp0Ii3yPZht4IIG8RogbZ
 KkxSXvCnKnyQYVN6c3GpBfJCyEVogJnlEZQpERHnRzWl8rwT/vGdU8FYP7ttIUrGJ8OJv1KEQ
 77X1Ma/rn2/xZJo2/EmsWvPSjaAe+6mmzmJbvxHxVgNUWSDgYAqZO8JavSaXf5hunuOapoWIL
 iBYoczihHWacIvAv4q/1PUKXuEmX/6iRcarRTwtfG/H9V9P6HCSIHSXVmK0FqfCCTq4jRn7eV
 VEBwjm8ZoWB28KvvIVXWIMBogcLI5TKpG6B6EG8lrB4AuNW2vqhax7i6AJIC6uQHygDhJxLy9
 Cd8JsDBPMOiEQpfDtGgoeAan9dbVT4GUj1e3PqvDnaLGFkW33iseA7MgDegIp3BYvlMve+Fae
 M9LXb/tcO2VCeU2zXVYFElUbgkeFQNaohsU3od9s4NZCLAMAt2ff1Sv+msJUzGQMTkWoIezc7
 fVec5xShw2tIWHQepdAyVbjWa4tWuJX6fi70IXaIrPSIHEcR5BZXvMYq1kK5Yyyh/MpDdFTE7
 qX83JpbQwwB/oCUAW5PGZuAcDfUfY9ZuQO7zNB3r0XCDoFM+Z/ziE05YrsFEYtcS4KE7PFDyr
 4GY76L/qLbB75Jq+Xq/x+KEBDZHRYqshywpKdBKWMuBfN4TIZSBS+r3CP7Jjrt15G3dA5bRWd
 U5jf7QSG26HDnK6h3YlPvQWa/NuVI3LA+tmDaT0cB1rltAuvKuZmkWwDh52cDwzSpLBQriXZb
 RAPtO0zTbVQL+vUQ0sBHiknuyE+rK61+vyh6ePbpp5T0v/9lOfbelAtep24AHEBYAfvXgcGv1
 d5G1HlBQBTzL2xBTKd0j18mku4AjPJmzBPrQqjWmnlbVbDQzPMCfCRtH0dsGuwVIrDih4LNms
 N6flusbuF/q4VHTB8f7o6GDuql/sLLQZfRYZIhjDGUZw+mdfu0uWDEqAk7ZvHML/6KPBcO2cg
 3KFb7kA0HEXW4dcv2U1rRCHs/nbJsfbvhU7IMZPy9Sa9enIEn7bFG3GVivlWu0FOQxJintehG
 BRYh1ISafVLlVS1+IlUeBenXBZkyumivhNhZmmafEVlliHUPA8OI8QxXgeZ2vfnskyl03rbJz
 4oaXB9tdDiHvxFKJr3zXJ0zOKwFER5AKqHHI9zdUptkOMB4BeqsNkaB8OKvr/lHjj3tPSCTYU
 jJygYGv/BnISfl43T0KgYy48RvotVcYrcq7C4rG3fLp+/Ml6gf0xaojsMatRMYJfSG60g9MfB
 5tzWYFLwwc1wkaB0SysoWGwDJkC98lTkhmWL269GsrAh1yLmBGaz2ljNvKhP00PFaKxaBOUqG
 pcdP0TJ7BpUwnU9mJqsJ9YQiK5yMcFxPRLJoRrKjc3OHfyXMWfbVNfzxnmS2DgS5iaUPjN5ot
 B6MhRwXq7kfnn326NySSzcPPARCiVKfgcD+X5is5UDDJohAlWArI0CMgufImZZ2ar/8bPdzVd
 cAbbOLVwRy7n652x2G+AygZyehDHmKPUXjj3R3AtPu7hligxUF3sf3MDaHk6TG4YT7tgCO/XM
 B+IgDUg17P1KzjDkN3cIAKT9kaxcxmCud5bXFNdKu8aidTN6dTOMlOU0Um8LhIQu9/wilnGRh
 uca2Mu7xmAVoyPGgT2Q1XlLPzUyTDWBgAZYiwCXSBGqENqxPhTVRJm2xuKS7zx6vrBb9RPI3A
 QZiUDgPEcUhJ5KQ0ymG8s5NXChJtY7pKwPFuTsCXhBWhEzaXpPBUwyqKq8s/EcaZke0ZiHa5q
 2IsUUCgWCxtwaBaiMmaerQ0O4+dma4QmhmexXZATpRRlTwuxAtq0cUVXinQ2s96Vs7rgGCbwu
 Bpq19WIMQc1paj0YkEYjD69szwYCFPxaApQSVM7abC8mleF8O1His/fFiT+HTpKykFyJOuZ4O
 tV93YqqEHZgE+fAAmtDREWaCJ6thbmpgljYixLNyn1ac9gJ2RByO7/fuJySuZkNYObUxJiu5Y
 Y0vo3hzvaIYKNku4rv6P3IFZJWh4RGajrbdDgOFQR8eoCHQ3Qz/2MQPemMYC5P1HTn/a23AeT
 D5j6O+pxYayq+nGLrzC32Boyz/QSpzq6yibENjxqsjQ99Jqr6DJQbHaCuSVGFlKnpBP6nqpMl
 xWtEr3kaOMFUpnH2al5G0sY5mRIgoVuV8eL7c2LRnGcqPRjOXWowlKXike1chR7mzKjjjcdm6
 ko6Dzu33Vt4tDpNhgAzNgAkvZmcv1zeLSCqrRbqMtqWuDrI1h5Tlv9zsjSNJBLaa0zhx+Mhe/
 Dhryc+tguZJPCi4BnjwwUyOvml+SFKsK/wkmR4g3y8IDG9bEh6U4AXqso1JNLyNOnfTIZAvdI
 mIUwFa+LnQPnGJlp3zwKmff6mRX/mp6A4tjKHnLLHtvE6lU98ZNa/zs0fY8n4z+0cpBbpRSQC
 z9cVwUSUwrtOG8ZkXyCt1ixxVJ1q7cGm+BRidoy96WviP79v1RLKURjy4ZftoYxLofQ42cEaB
 J0XH9q2dWvPGUB/7dh5lbF36aTKbHV1iT3UkGtTI4MmgF59bvhIch9TiRG9mrwnkpx8Jtw553
 ve+zhDX9ijwtyntRzdakkfQVq8Q6zQuH5vyuS+yaYi7J6ko045GMJJZG8n1d8Vmx867oVyRJT
 H+KCheQjMZGMOs8WDEQect2/fEdB1gWg0MyzJWWNFVrRaM42HWiKwx3IhusJdBYL1NRfATqkE
 NdDu5dkDu4eFf/OeX5HiO9vyKnRMwNX/vSiOqGbnM1ybuqYqpW5ZMGBf5JindQhL+/tqtlHnm
 mxLn9zEbnoph2vSRm2DUaFG0IyW6Bp3+dH/mSRVp7yFwKEqdNwR6kBUcj5lns51je

=E2=80=A6
> +++ b/drivers/bus/mhi/host/mhi_loopback.c
> @@ -0,0 +1,348 @@
=E2=80=A6
> +static ssize_t start_store(struct device *dev,
> +			   struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct mhi_loopback *mhi_lb =3D dev_get_drvdata(dev);
> +	void *send_buf, *recv_buf;
=E2=80=A6
> +	guard(mutex)(&mhi_lb->lb_mutex);
=E2=80=A6
> +free_buf:
> +	kfree(send_buf);
> +free_recv_buf:
> +	kfree(recv_buf);
> +unlock:
+	mhi_lb->loopback_in_progress =3D false;
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply an attribut=
e
like =E2=80=9C__free(kfree)=E2=80=9D?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/slab.h#L47=
6

Regards,
Markus

